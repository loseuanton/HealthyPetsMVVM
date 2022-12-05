//
//  DocumentsViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.11.22.
//

import UIKit

class DocumentsViewController: UIViewController {
    var openPassportScreen: ((NewDog) -> Void)?
    
    var rootView = DocumentsView()
    let viewModel = DocumentsViewModel()
    var items: [BaseConfigureTableCellRowProtocol] = []
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        rootView.documentsTableView.register(DocumentsTableViewCell.self, forCellReuseIdentifier: "DocumentsTableViewCellItem")
        rootView.documentsTableView.delegate = self
        rootView.documentsTableView.dataSource = self
        configureView()
        bindingViewModel()
        viewModel.loadTableCells()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rootView.gradient()
       
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindingViewModel()
        print(viewModel.documentsCopy)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
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
            self?.rootView.documentsTableView.reloadData()
            
        }
    }
}
extension DocumentsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        if let documentsAnimal = viewModel.documentsCopy {
            openPassportScreen?(documentsAnimal)
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = rootView.documentsTableView.bounds.height / 2.0
       
        return height
    }
    
}
