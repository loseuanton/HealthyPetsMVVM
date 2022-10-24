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
    var openListDogs: (( ((String?)->Void)? ) -> Void)?
    
}

class BreedsDogCollectionViewCell: BaseCollectionViewCell {
    var item: BreedsDogCollectionViewCellItem?
    var items: [BaseConfigureTableCellRowProtocol] = []
    let viewModel = AddNewDogViewModel()
    
   
    // TODO: вопрос 3 по выбору породы
    var dogName: String?
    
    
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
        breedsDogTableView.removeFromSuperview()
        dogBreed.removeFromSuperview()
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
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
           return items.count
        } else {
            
            return 1
        }
            
        
        
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BreedsDogTableViewCell {
            if indexPath.section == 0 {
                cell.configure(item: item)
                cell.accessoryType = .none
                if indexPath.row == 3 {
                    cell.layer.cornerRadius = 10
                    cell.clipsToBounds = true
                    cell.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                }
                
            } else {
                // TODO: вопрос 3 по выбору породы
                cell.dogBreed.text = dogName ?? "У меня другая порода"
                cell.dogBreed.textColor = .black
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
            // TODO: вопрос 3 по выбору породы
            let complition = { [weak self] dogName in
                self?.dogName = dogName
                self?.breedsDogTableView.reloadData()
                self?.item?.changeDogBreed?(dogName ?? "Другая порода")
            }
            self.item?.openListDogs?(complition)
        } else {
            if let item = items[indexPath.row] as? BreedsDogTableViewCellItem {
                let dog = item.dog
                let dogName = dog?.name
                self.item?.changeDogBreed?(dog?.name ?? "Другая порода")
                print(dogName)
            }
            

        }
        if let cell = tableView.cellForRow(at: indexPath) as? BreedsDogTableViewCell {
            cell.selectCell()
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? BreedsDogTableViewCell {
            cell.deselectCell()
        }
        
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


