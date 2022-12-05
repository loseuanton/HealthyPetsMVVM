//
//  AllTypesViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 22.11.22.
//

import Foundation
import UIKit

class AllTypesViewController: UIViewController {
    var openMapScreen: ((AllTypes) -> Void)?
    var openMarkersMapScreen: (([AllTypes]) -> Void)?
    // MARK: - Views
    var rootView = AllTypesView()
    let viewModel = AllTypesViewModel()
    var items: [BaseConfigureTableCellRowProtocol] = []
    var types: [AllTypes]?
    var double = 0.0
    var double2 = 0.0
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.tableView.register(AllTypesTableViewCell.self, forCellReuseIdentifier: "AllTypesTableViewCellItem")
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        configureView()
        
        bindingViewModel()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
       // rootView.backgroundView.gradient()
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
        let rigthBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rigthBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rigthBarButton
        rootView.rightBarButton.addTarget(self, action: #selector(openMapVC), for: .touchUpInside)
        
    }
    
    
    
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.tableView.reloadData()
            
        }
    }
    @objc func openMapVC() {
        if let types = viewModel.typesOfServices?.allTypes {
            self.openMarkersMapScreen?(types)
            types.forEach({ typeService in
                double = typeService.longitude
                double2 = typeService.latitude
                print(double)
                print(double2)
            })
        }
        
        
    }
    
}
extension AllTypesViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        if let item: AllTypesTableViewCellItem = items[indexPath.row] as? AllTypesTableViewCellItem {
            if let typeServices = item.typeServices {
                self.openMapScreen?(typeServices)
            }
        }
        
    }
    
}



