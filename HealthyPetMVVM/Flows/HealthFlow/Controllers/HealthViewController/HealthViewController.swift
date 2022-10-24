//
//  HealthViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import UIKit

class HealthViewController: UIViewController {
    var openEditReminderScreen: ((Reminder) -> Void)?
    var items: [BaseConfigureTableCellRowProtocol] = []
    var rootView = HealthView()
    let viewModel = HealthViewModel()
    
    var newTitle: ((String, UIImage?) -> Void)?
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.healthyTableView.register(HealthTableViewCell.self, forCellReuseIdentifier: "HealthTableViewCellItem")
        rootView.healthyTableView.register(HealthReminderTableViewCell.self, forCellReuseIdentifier: "HealthReminderTableViewCellItem")
        rootView.healthyTableView.delegate = self
        rootView.healthyTableView.dataSource = self
        viewModel.newTitle = self.newTitle
        configureView()
        bindingViewModel()
        
       
        viewModel.loadTableCells()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindingViewModel()
        rootView.backgroundView.gradient()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadTableCells()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        navigationItem.title = "Здоровье"
    }
    
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.healthyTableView.reloadData()
            
        }
    }
}
extension HealthViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return items.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: BaseConfigureTableCellRowProtocol = items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BaseTableViewCell {
           
            cell.configure(item: item)
            
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item: HealthReminderTableViewCellItem = items[indexPath.row] as? HealthReminderTableViewCellItem {
            print(item.reminder)
            if let reminder = item.reminder {
                self.openEditReminderScreen?(reminder)
            }
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            let height = 430.0
            return height
        } else {
            if let item: HealthReminderTableViewCellItem = items[indexPath.row] as? HealthReminderTableViewCellItem {
                if Date() >= item.reminder?.time ?? Date() {
                    return 96.0
                }
            }
            let height = 76.0
            return height
        }
        
    }
    
}
