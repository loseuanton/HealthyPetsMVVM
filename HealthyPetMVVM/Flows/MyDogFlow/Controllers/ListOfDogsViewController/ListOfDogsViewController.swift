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
    
    
    // TODO: вопрос 3 по выбору породы
    var selectDog: String?
    var doneSelectDog: ((String?)->Void)?
    var completionHendler: ((String) -> Void)?
    private var filterData: [String]!
    
    
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
        
        rootView.rightBarButton.addTarget(self, action: #selector(didSelectDone), for: .touchUpInside)
    }
    
    // TODO: вопрос 3 по выбору породы
    @objc func didSelectDone() {
        doneSelectDog?(selectDog)
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
            //let dogName = dog?.name
            print(dog)
            
            
        }
        if let item = items[indexPath.row] as? ListOfDogsTableViewCellItem {
            let dog = item.listOfDog?.name
            
            
            completionHendler?(dog ?? "")
            print("\(dog) select new breed")
        }
        
        
        // TODO: вопрос 4 по смене цвета текста
        if let cell = tableView.cellForRow(at: indexPath) as? ListOfDogsTableViewCell {
            cell.selectCell()
        }
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // TODO: вопрос 4 по смене цвета текста
        if let cell = tableView.cellForRow(at: indexPath) as? ListOfDogsTableViewCell {
            cell.deselectCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 24
    }
    
}


 

