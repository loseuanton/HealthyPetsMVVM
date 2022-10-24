//
//  SettingsViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var rootView = SettingsView()
    let viewModel = SettingsViewModel()
    var items: [BaseConfigureTableCellRowProtocol] = []
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.settingsTableView.register(LanguageTableViewCell.self, forCellReuseIdentifier: "LanguageTableViewCellItem")
        rootView.settingsTableView.register(RateUsAndPrivacyPolicyTableViewCell.self, forCellReuseIdentifier: "RateUsAndPrivacyPolicyTableViewCellItem")
        rootView.settingsTableView.delegate = self
        rootView.settingsTableView.dataSource = self
        configureView()
        bindingViewModel()
        viewModel.loadTableCells()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.backgroundView.gradient()
    }
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        navigationItem.title = "Настройки"
    }
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.settingsTableView.reloadData()
            
        }
    }
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
   
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let isLastCell = indexPath.row == items.count - 1
        let defaultInset = tableView.separatorInset
        
        if isLastCell {
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.width, bottom: 0, right: 0)
        } else {
            cell.separatorInset = defaultInset
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: BaseConfigureTableCellRowProtocol = items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BaseTableViewCell {
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.configure(item: item)
            //cell.separatorInset = UIEdgeInsets.zero
            
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = rootView.settingsTableView.bounds.height / 3.0
       
        return height
    }
    
}
