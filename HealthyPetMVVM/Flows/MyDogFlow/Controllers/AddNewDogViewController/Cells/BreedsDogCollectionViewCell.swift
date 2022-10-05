//
//  BreedsDogCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit
import SnapKit

struct BreedsDogCollectionViewCellItem: BaseConfigureCollectionCellRowProtocol {
    var cellIdentifier = "BreedsDogCollectionViewCellItem"
    var changeDogBreed: ((String) -> Void)?
    var openListDogs: (() -> Void)?
    
}

class BreedsDogCollectionViewCell: BaseCollectionViewCell {
    var item: BreedsDogCollectionViewCellItem?
    var items: [BaseConfigureTableCellRowProtocol] = []
    let viewModel = AddNewDogViewModel()
    
   
    
    
    
    
    var dogBreed = UILabel()
    var breedsDogTableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        bindingViewModel()
        viewModel.loadTableCells()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        
    }
    private func configureCell() {
        addSubviews()
        configureLayout()
    }
    override func configure(item: BaseConfigureCollectionCellRowProtocol) {
        dogBreed.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 20, text: "Какая порода у вашей собаки?", letter: 0.38)
        dogBreed.font = UIFont.boldSystemFont(ofSize: CGFloat(20).adaptedFontSize)
        
        breedsDogTableView.register(BreedsDogTableViewCell.self, forCellReuseIdentifier: "BreedsDogTableViewCellItem")
        breedsDogTableView.delegate = self
        breedsDogTableView.dataSource = self
        breedsDogTableView.backgroundColor = .clear
        breedsDogTableView.isHidden = false
        breedsDogTableView.layer.cornerRadius = 10
        breedsDogTableView.clipsToBounds = true
        breedsDogTableView.isScrollEnabled = false
        if let item = item as? BreedsDogCollectionViewCellItem {
            self.item = item
        }
    }
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.breedsDogTableView.reloadData()
            
        }
    }
    
    func addSubviews() {
        contentView.addSubview(dogBreed)
        contentView.addSubview(breedsDogTableView)
        
    }
    func configureLayout() {
        dogBreed.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24.VAdapted)
            make.centerX.equalToSuperview()
            make.height.equalTo(24.VAdapted)
        }
        breedsDogTableView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(80.VAdapted)
            make.size.equalTo([280, 236].HResized)
            make.left.equalTo(contentView.snp.left).offset(55.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-55.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24.VAdapted)
        }
    }
}

extension BreedsDogCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            self.layer.cornerRadius = 10
            self.clipsToBounds = true
           return items.count
        } else {
            
            return 1
        }
            
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: BaseConfigureTableCellRowProtocol = items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BaseTableViewCell {
            if indexPath.section == 0 {
                cell.configure(item: item)
            } else {
                cell.textLabel?.text = "У меня другая порода"
                cell.textLabel?.textColor = .black
                cell.accessoryType = .disclosureIndicator
                cell.layer.cornerRadius = 10
                cell.clipsToBounds = true
                
                
            }
            cell.selectionStyle = .none
            
            
            return cell
        }
        return UITableViewCell()
            
            
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            self.item?.openListDogs?()
            
        } else {
            if let item = items[indexPath.row] as? BreedsDogTableViewCellItem {
                let dog = item.dog
                let dogName = dog?.name
                self.item?.changeDogBreed?(dog?.name ?? "Другая порода")
                print(dogName)
            }
            
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.cellForRow(at: indexPath)?.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 16.VAdapted
        }
        return 0.VAdapted
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.VAdapted
    }
    
    
    
    
}


