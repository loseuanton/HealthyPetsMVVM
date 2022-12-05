//
//  TypesOfServicesViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 17.11.22.
//

import UIKit
import SnapKit

class TypesOfServicesViewController: UIViewController {
    var openAllTypesScreen: ((TypesOfServices) -> Void)?
    var items: [BaseConfigureTableCellRowProtocol] = []
    
    var rootView = TypesOfServicesView()
    let viewModel = TypesOfServicesViewModel()
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        rootView.tableView.register(TypesOfServicesTableViewCell.self, forCellReuseIdentifier: "TypesOfServicesTableViewCellItem")
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
      //  rootView.searchBar.delegate = self
        handleSegmentChange()
        configureView()
        bindingViewModel()
        viewModel.loadTableCells(for: rootView.currentShopType ?? .shop)
        
        navigationItem.searchController = rootView.searchBar
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rootView.backgroundView.gradient()
        handleSegmentChange()
        viewModel.loadTableCells(for: rootView.currentShopType ?? .shop)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        handleSegmentChange()
        viewModel.loadTableCells(for: rootView.currentShopType ?? .shop)
    }
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        navigationItem.title = "Зоомагазин"
        rootView.segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
        
    }
    
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] item in
            self?.items = item
            self?.handleSegmentChange()
            self?.rootView.tableView.reloadData()
            
        }
    }
    @objc fileprivate func handleSegmentChange() {
        switch rootView.segmentedControl.selectedSegmentIndex {
        case 0:
            rootView.currentShopType = .shop
        case 1:
            rootView.currentShopType = .vetcilic
        default:
            rootView.currentShopType = .grooming
            
        }
       
        rootView.tableView.reloadData()
    }
}
extension TypesOfServicesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        if let item: TypesOfServicesTableViewCellItem = items[indexPath.row] as? TypesOfServicesTableViewCellItem {
            if let typesOfServices = item.typesOfServices {
                self.openAllTypesScreen?(typesOfServices)
            }
        }
    }
}
//extension PetShopViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText == "" {
//            viewModel.loadTableCells(for: .shop)
//        } else {
//            viewModel.filterArray(text: searchText)
//        }
//
//    }
//}
