//
//  ListOfDogsViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 14.08.22.
//

import Foundation
import UIKit

class ListOfDogsViewController: UIViewController {
    // MARK: - Views
    var rootView = ListOfDogsView()
    let viewModel = ListOfDogsViewModel()
    var items: [BaseConfigureTableCellRowProtocol] = []
    
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.listOfDogsTableView.register(ListOfDogsTableViewCell.self, forCellReuseIdentifier: "ListOfDogsTableViewCellItem")
        rootView.listOfDogsTableView.delegate = self
        rootView.listOfDogsTableView.dataSource = self
        configureView()
        bindingViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadTableCells()
    }
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let rigthBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rigthBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rigthBarButton
        navigationItem.title = "Порода"
    }
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.listOfDogsTableView.reloadData()
            
        }
    }
    
}
extension ListOfDogsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        if let item = items[indexPath.row] as? ListOfDogsTableViewCellItem {
            let dog = item.listOfDog?.name
            //let dogName = dog?.name
            print(dog)
            
            
        }
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.cellForRow(at: indexPath)?.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 24
    }
    
}
/*
 extension ListOfDogsViewController: UISearchBarDelegate {
 func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 
 rootView.filterData = []
 if searchText == "" {
 
 }
 for word in items {
 if word.uppercased().contains(searchText.uppercased()) {
 rootView.filterData.append(word)
 }
 }
 self.rootView.listOfDogsTableView.reloadData()
 }
 }
 */

