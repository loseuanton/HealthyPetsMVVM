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
    var selectDog: String?
    var selectNewDog: String?
    var doneSelectDog: ((String?) -> Void)?
    var completionHendler: ((String?) -> Void)?
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.listOfDogsTableView.register(ListOfDogsTableViewCell.self, forCellReuseIdentifier: "ListOfDogsTableViewCellItem")
        rootView.listOfDogsTableView.delegate = self
        rootView.listOfDogsTableView.dataSource = self
        rootView.searchBar.delegate = self
        configureView()
        bindingViewModel()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadTableCells(for: rootView.currentPetType ?? .dog)
    }
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closedScreen), for: .touchUpInside)
        
        let rigthBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rigthBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rigthBarButton
        navigationItem.title = "Порода"
        
        rootView.rightBarButton.addTarget(self, action: #selector(didSelectDone), for: .touchUpInside)
    }
    
    @objc func didSelectDone() {
        doneSelectDog?(selectDog)
        completionHendler?(selectNewDog)
        self.dismiss(animated: true)
    }
    @objc func closedScreen() {
        self.dismiss(animated: true)
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
            selectDog = dog
        }
        if let item = items[indexPath.row] as? ListOfDogsTableViewCellItem {
            let dog = item.listOfDog?.name
            selectNewDog = dog
        }
        
        if let cell = tableView.cellForRow(at: indexPath) as? ListOfDogsTableViewCell {
            cell.selectCell()
            
        }
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ListOfDogsTableViewCell {
            cell.deselectCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 24
    }
    
}

extension ListOfDogsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.loadTableCells(for: .dog)
        } else {
            viewModel.filterArray(text: searchText)
        }
        
    }
}
 

