//
//  ListOfDogsTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 14.08.22.
//

import UIKit
import SnapKit

struct ListOfDogsTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "ListOfDogsTableViewCellItem"
    var listOfDog: ListOfDogs?
    
}

class ListOfDogsTableViewCell: BaseTableViewCell {
    var item: ListOfDogsTableViewCellItem?
    var dogNicknameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        configureCell()
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
        dogNicknameLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "", letter: -0.41)
        
        
        if let item = item as? ListOfDogsTableViewCellItem {
            self.item = item
            
            self.dogNicknameLabel.text = item.listOfDog?.name
            print(item.listOfDog?.name)
        }
    }
    
    // TODO: вопрос 4 по смене цвета текста
    
    func selectCell() {
        self.accessoryType = .checkmark
        self.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        dogNicknameLabel.textColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
    }
    
    func deselectCell() {
        self.accessoryType = .none
        self.tintColor = .black
        dogNicknameLabel.textColor = .black
    }
    
    
    
    func addSubviews() {
        contentView.addSubview(dogNicknameLabel)
    }
    func configureLayout() {
        dogNicknameLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(16.HAdapted)
            make.right.equalTo(self).offset(-16.HAdapted)
            make.height.equalTo(22.VAdapted)
            make.centerY.equalToSuperview()
        }
       
        
        
    }
    
    
    
    
    
    
}
