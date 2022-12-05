//
//  EditGenderTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 24.09.22.
//

import Foundation
import UIKit
import SnapKit

class EditGenderTableViewCellItem: BaseConfigureTableCellRowProtocol {
    init(){}
    var cellIdentifier = "EditGenderTableViewCellItem"
    var dog: NewDog?
    var updateDogGenderComplition: ((String) -> Void)?
    func updateDogYearsAge(gender: String) {
        updateDogGenderComplition?(gender)
    }
}

class EditGenderTableViewCell: BaseTableViewCell {
    var item: EditGenderTableViewCellItem?
    var genderLabel = UILabel()
    var maleOrFemaleLabel = UILabel()
    var customAccessoryType = UIImageView()
    
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
        customAccessoryType.image = UIImage(systemName: "chevron.down")
        customAccessoryType.tintColor = .black
        genderLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "Пол", letter: -0.08)
        genderLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        genderLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        maleOrFemaleLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Не указано", letter: -0.41)
        if let item = item as? EditGenderTableViewCellItem {
            self.item = item
            maleOrFemaleLabel.text = item.dog?.copyNewDog().gender
            
        }
        self.item?.updateDogGenderComplition = { gender in
            self.maleOrFemaleLabel.text = "\(gender)"
            print(gender)
        }
    }
    func addSubviews() {
        contentView.addSubview(genderLabel)
        contentView.addSubview(maleOrFemaleLabel)
        contentView.addSubview(customAccessoryType)
        
        
    }
    func configureLayout() {
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(customAccessoryType.snp.left).offset(-6.HAdapted)
            make.bottom.equalTo(maleOrFemaleLabel.snp.top).offset(-4.VAdapted)
        }
        maleOrFemaleLabel.snp.makeConstraints { make in
            //make.top.equalTo(genderLabel.snp.top).offset(4.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(customAccessoryType.snp.left).offset(-6.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8.VAdapted)
        }
        customAccessoryType.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-13.HAdapted)
            make.centerY.equalTo(contentView.snp.centerY)
            make.size.equalTo([20, 20].HResized)
        }
    }
    
    
    
    
}

