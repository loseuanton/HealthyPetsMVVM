//
//  HealthViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import UIKit

class HealthViewController: UIViewController {
    var openNextScreen: ((String) -> Void)?
    var item: [BaseConfigureTableCellRowProtocol] = []
    var items: [BaseConfigureCollectionCellRowProtocol] = []
    var items2: [BaseConfigureCollectionCellRowProtocol] = []
    var rootView = HealthView()
    let viewModel = HealthViewModel()
    lazy var rowsToDisplay = self.items
    var newTitle: ((String) -> Void)?
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingViewModel()
        bindingViewModelTableView()
        rootView.collectionView.register(HealthCollectionViewCell.self, forCellWithReuseIdentifier: "HealthCollectionViewCellItem")
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        rootView.tableView.register(HealthTableViewCell.self, forCellReuseIdentifier: "HealthTableViewCellItem")
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        configureView()
        viewModel.loadCells()
        viewModel.loadTableCells()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.backgroundView.gradient()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        navigationItem.title = "Здоровье"
        rootView.segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
        
        
    }
    func bindingViewModelTableView() {
        viewModel.complitionTableLoadData = { [weak self] item in
            self?.item = item
            self?.rootView.tableView.reloadData()
            
        }
    }
    
    func bindingViewModel() {
        viewModel.complitionLoadData = { [weak self] items, items2 in
            self?.items = items
            self?.items2 = items2
            self?.handleSegmentChange()
            self?.rootView.collectionView.reloadData()
            
        }
    }
    @objc fileprivate func handleSegmentChange() {
        switch rootView.segmentedControl.selectedSegmentIndex {
        case 0:
            rowsToDisplay = items
        default:
            rowsToDisplay = items2
            
        }
        rootView.collectionView.reloadData()
    }
    
    
    
    
    
    
}
extension HealthViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item: BaseConfigureCollectionCellRowProtocol = rowsToDisplay[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cellIdentifier, for: indexPath) as? BaseCollectionViewCell {
            cell.configure(item: item)
            
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let item = items[indexPath.row] as? HealthCollectionViewCellItem {
            
            let title = item.careArray?.name
            openNextScreen?(title ?? "")
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 109.HAdapted, height: 90)
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 38.HAdapted
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15.HAdapted
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 26.VAdapted, left: 16.HAdapted, bottom: 20.VAdapted, right: 16.HAdapted)
    }
    
    
    
    
}
extension HealthViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return item.count
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: BaseConfigureTableCellRowProtocol = item[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BaseTableViewCell {
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.configure(item: item)
            
            
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = rootView.settingsTableView.bounds.height / 3.0
       
        return height
    }
     */
    
}


