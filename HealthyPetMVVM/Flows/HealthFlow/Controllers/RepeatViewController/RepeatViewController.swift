//
//  RepeatViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 19.09.22.
//

import UIKit

class RepeatViewController: UIViewController {
    
    var rootView = RepeatView()
    let viewModel = RepeatViewModel()
    var items: [BaseConfigureTableCellRowProtocol] = []
    var completionHendler: ((String) -> Void)?
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.repeatTableView.register(RepeatTableViewCell.self, forCellReuseIdentifier: "RepeatTableViewCellItem")
       
        rootView.repeatTableView.delegate = self
        rootView.repeatTableView.dataSource = self
        configureView()
        bindingViewModel()
        viewModel.loadTableCells()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
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
        navigationItem.title = "Повтор"
    }
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.repeatTableView.reloadData()
            
        }
    }
    @objc func closeScreen() {
        self.dismiss(animated: true)
    }
}
extension RepeatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: BaseConfigureTableCellRowProtocol = items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BaseTableViewCell {
            cell.selectionStyle = .none
            
            cell.configure(item: item)
            
            
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = items[indexPath.row] as? RepeatTableViewCellItem {
            let repeats = item.repeats?.repeats
            
            print(repeats)
            completionHendler?(repeats ?? "")
        }
        if let cell = tableView.cellForRow(at: indexPath) as? RepeatTableViewCell {
            cell.selectCell()
        }
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? RepeatTableViewCell {
            cell.deselectCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = rootView.repeatTableView.bounds.height / 5.0
       
        return height
    }
    
}
