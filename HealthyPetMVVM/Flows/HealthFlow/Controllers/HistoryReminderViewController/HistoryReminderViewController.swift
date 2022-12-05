//
//  HistoryReminderViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 26.10.22.
//

import UIKit

class HistoryReminderViewController: UIViewController, UIGestureRecognizerDelegate {
    var openDescriptionHistoryReminderScreen: ((HistoryReminder) -> Void)?
    var items: [BaseConfigureTableCellRowProtocol] = []
    var rootView = HistoryReminderView()
    let viewModel = HistoryReminderViewModel()
    
   
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.historyReminderTableView.register(HistoryReminderTableViewCell.self, forCellReuseIdentifier: "HistoryReminderTableViewCellItem")
        rootView.historyReminderTableView.delegate = self
        rootView.historyReminderTableView.dataSource = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        configureView()
        bindingViewModel()
        
       
        viewModel.loadTableCells()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindingViewModel()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadTableCells()
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.gradient()
    }
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        navigationItem.title = "История"
    }
    
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.historyReminderTableView.reloadData()
            
        }
    }
    @objc func closeScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
extension HistoryReminderViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count <= 0 ? rootView.addNoReminderIconAndLabel() : rootView.removeIconAndLabel()
            return items.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: BaseConfigureTableCellRowProtocol = items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BaseTableViewCell {
            
           
            cell.configure(item: item)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item: HistoryReminderTableViewCellItem = items[indexPath.row] as? HistoryReminderTableViewCellItem {
            print(item.historyReminder)
            if let historyReminder = item.historyReminder {
                self.openDescriptionHistoryReminderScreen?(historyReminder)
            }
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            let height = 76.0
            return height
        
    }
    
}

