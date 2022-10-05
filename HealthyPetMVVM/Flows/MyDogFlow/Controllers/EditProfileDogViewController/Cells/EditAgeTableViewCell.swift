//
//  EditAgeTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 24.09.22.
//

import Foundation
import UIKit
import SnapKit

struct EditAgeTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "EditAgeTableViewCellItem"
    var dog: NewDog?
}

class EditAgeTableViewCell: BaseTableViewCell {
    var item: EditAgeTableViewCellItem?
     var ageLabel = UILabel()
     var ageTextLabel = UILabel()
    
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
        ageLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "Возраст", letter: -0.08)
        ageLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        ageLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        ageTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "1 год 12 месяцев", letter: -0.41)
        if let item = item as? EditAgeTableViewCellItem {
            self.item = item
            
            ageTextLabel.text = "\(item.dog?.ageYears ?? 0) год \(item.dog?.ageMonth ?? 0) месяцев"
            
        }
    }
    func addSubviews() {
        contentView.addSubview(ageLabel)
        contentView.addSubview(ageTextLabel)
        
        
    }
    func configureLayout() {
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(ageTextLabel.snp.top).offset(-4.VAdapted)
        }
        ageTextLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8.VAdapted)
        }
    }
    
    
    
    
}


