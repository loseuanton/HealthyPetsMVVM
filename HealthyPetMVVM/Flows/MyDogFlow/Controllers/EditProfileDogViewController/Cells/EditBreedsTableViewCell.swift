//
//  EditBreedsTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 24.09.22.
//

import Foundation
import UIKit
import SnapKit

struct EditBreedsTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "EditBreedsTableViewCellItem"
    var dog: NewDog?
}

class EditBreedsTableViewCell: BaseTableViewCell {
    var item: EditBreedsTableViewCellItem?
     var breedLabel = UILabel()
     var breedTextLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
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
        breedLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "Возраст", letter: -0.08)
        breedLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        breedLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        breedTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Не указано", letter: -0.41)
        if let item = item as? EditBreedsTableViewCellItem {
            self.item = item
            breedTextLabel.text = item.dog?.breed

        }
    }
    func addSubviews() {
        contentView.addSubview(breedLabel)
        contentView.addSubview(breedTextLabel)
        
        
    }
    func configureLayout() {
        breedLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(breedTextLabel.snp.top).offset(-4.VAdapted)
        }
        breedTextLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8.VAdapted)
        
        }
    }
    
    
    
    
}



