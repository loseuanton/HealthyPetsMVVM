//
//  HealthTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.10.22.
//

import UIKit
import SnapKit

struct HealthTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "HealthTableViewCellItem"
    var newTitle: ((String, UIImage?) -> Void)?
    var changeReminderAction: ((String) -> Void)?
    var reminder: Reminder = Reminder()
    
    
}

class HealthTableViewCell: BaseTableViewCell {
    var item: HealthTableViewCellItem?
    var healthyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var items: [BaseConfigureCollectionCellRowProtocol] = []
    var items2: [BaseConfigureCollectionCellRowProtocol] = []
    
    var rootView = HealthView()
    let viewModel = HealthViewModel()
    var segmentedControl = UISegmentedControl(items: ["Уход", "Медицина"])
    lazy var rowsToDisplay = self.items
    //var newTitle: ((String) -> Void)?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        bindingViewModel()
        configureCell()
        
        viewModel.loadCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    private func configureCell() {
        addSubviews()
        configureLayout()
        
    }
    override func configure(item: BaseConfigureTableCellRowProtocol) {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)], for: .selected)
        
        rootView.collectionView.register(HealthCollectionViewCell.self, forCellWithReuseIdentifier: "HealthCollectionViewCellItem")
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        rootView.collectionView.backgroundColor = .clear
        
        segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
        if let item = item as? HealthTableViewCellItem {
            self.item = item
            
            
        }
        handleSegmentChange()
        rootView.collectionView.reloadData()
        
    }
    func addSubviews() {
        contentView.addSubview(segmentedControl)
        contentView.addSubview(rootView.collectionView)
        
    }
    func configureLayout() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(0.VAdapted)
            make.leading.equalTo(contentView.snp.leading).offset(16.HAdapted)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16.HAdapted)
            make.height.equalTo(32)
        }
        rootView.collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom)
            
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
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowsToDisplay = items
        default:
            rowsToDisplay = items2
            
        }
        rootView.collectionView.reloadData()
    }
    

}
extension HealthTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        
        if let item = rowsToDisplay[indexPath.row] as? HealthCollectionViewCellItem {
            
            let title = item.careArray?.name
            let image = item.careArray?.image
            self.item?.newTitle?(title ?? "", image)
           
            
            print(image)
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
        return UIEdgeInsets(top: 24.VAdapted, left: 16.HAdapted, bottom: 20.VAdapted, right: 16.HAdapted)
    }
    
    
    
    
}

