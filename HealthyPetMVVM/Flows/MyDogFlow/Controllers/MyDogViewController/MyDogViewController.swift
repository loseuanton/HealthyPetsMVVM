//
//  MyDogViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import UIKit
import SnapKit

class MyDogViewController: UIViewController {
    var openAddNewDogScreen: (() -> Void)?
    var openEditProfileDogScreen: ((NewDog) -> Void)?
    
    // MARK: - Views
    var rootView = MyDogView()
    let viewModel = MyDogViewModel()
    var items: [BaseConfigureCollectionCellRowProtocol] = []
    var newDogServices = NewDogServices()
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.myDogsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rootView.layout)
        rootView.myDogsCollectionView.register(MyDogsCollectionViewCell.self, forCellWithReuseIdentifier: "MyDogsCollectionViewCellItem")
        configureView()
        rootView.myDogsCollectionView.delegate = self
        rootView.myDogsCollectionView.dataSource = self
        bindingViewModel()
        viewModel.loadCells()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.backgroundView.gradient()
        print("\(newDogServices.getNewDogs())")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadCells()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        rootView.leftButton.addTarget(self, action: #selector(left), for: .touchUpInside)
        rootView.rightButton.addTarget(self, action: #selector(right), for: .touchUpInside)
        let rigthBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rigthBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rigthBarButton
        rootView.rightBarButton.addTarget(self, action: #selector(openEditProfileDogController), for: .touchUpInside)
        
        
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(openAddNewDogController), for: .touchUpInside)
        
    }
    func bindingViewModel() {
        viewModel.complitionLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.myDogsCollectionView.reloadData()
            
        }
    }
    @objc func openAddNewDogController() {
        openAddNewDogScreen?()
    }
    @objc func openEditProfileDogController() {
        if let currentCenteredPage = currentCenteredPage,
           items.count > currentCenteredPage,
           let selectItem = items[currentCenteredPage] as? MyDogsCollectionViewCellItem,
           let selectDog = selectItem.newDog {
            
            openEditProfileDogScreen?(selectDog)
            
            
        }
    }
    @objc func left() {
        if rootView.currentPage > 0 {
            rootView.currentPage -= 1
            rootView.myDogsCollectionView.scrollToItem(at: NSIndexPath(row: rootView.currentPage, section: 0) as IndexPath, at: .centeredHorizontally, animated: false)
            //rootView.myDogsCollectionView.reloadData()
            
        }
    }
    @objc func right() {
        if rootView.currentPage < items.count - 1 {
            rootView.currentPage += 1
            
            rootView.myDogsCollectionView.scrollToItem(at: NSIndexPath(row: rootView.currentPage, section: 0) as IndexPath, at: .centeredHorizontally, animated: false)
            //rootView.myDogsCollectionView.reloadData()
            
        }
    }
    public var currentCenteredPage: Int? {
        let collectionView = rootView.myDogsCollectionView
        let currentCenteredPoint = CGPoint(x: collectionView.contentOffset.x + collectionView.bounds.width/2, y: collectionView.contentOffset.y + collectionView.bounds.height/2)
        
        return collectionView.indexPathForItem(at: currentCenteredPoint)?.row
    }
    
    
    
    
    
}
extension MyDogViewController: UICollectionViewDelegate {
    
    
    
}
extension MyDogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item: BaseConfigureCollectionCellRowProtocol = items[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cellIdentifier, for: indexPath) as? BaseCollectionViewCell {
            
            cell.configure(item: item)
            
           
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    
}
extension MyDogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230.HAdapted, height: 200.VAdapted)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



