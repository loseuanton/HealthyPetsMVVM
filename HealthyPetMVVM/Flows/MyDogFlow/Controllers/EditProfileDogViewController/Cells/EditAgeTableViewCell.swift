//
//  EditAgeTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 24.09.22.
//

import Foundation
import UIKit
import SnapKit

class EditAgeTableViewCellItem: BaseConfigureTableCellRowProtocol {
    init(){}
    var cellIdentifier = "EditAgeTableViewCellItem"
    var dog: NewDog?
    var updateDogAgeYearsComplition: ((Int) -> Void)?
    func updateDogAgeYears(age: Int) {
        updateDogAgeYearsComplition?(age)
    }
    
    var updateDogAgeMonthComplition: ((Int) -> Void)?
    func updateDogAgeMonth(age: Int) {
        updateDogAgeMonthComplition?(age)
    }
}

class EditAgeTableViewCell: BaseTableViewCell {
    var item: EditAgeTableViewCellItem?
     var ageLabelText = UILabel()
     var fullAgeTextLabel = UILabel()
    
    var ageLabel = UILabel()
    var ageTextLabel = UILabel()
    var monthLabel = UILabel()
    var monthTextLabel = UILabel()
    
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
        ageLabelText.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "Возраст", letter: -0.08)
        ageLabelText.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        ageLabelText.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        
        
        ageLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 20, text: "0", letter: 0.38)
        ageLabel.textAlignment = .center
        
        
        ageTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "лет", letter: -0.24)
        ageTextLabel.textAlignment = .center
        ageTextLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        ageTextLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        monthLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 20, text: "0", letter: 0.38)
        monthLabel.textAlignment = .center
        
        monthTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "месяцев", letter: -0.24)
        monthTextLabel.textAlignment = .center
        monthTextLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        monthTextLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        fullAgeTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "\(ageLabel.text) \(ageTextLabel.text) \(monthLabel.text) \(monthTextLabel.text)", letter: -0.41)
        if let item = item as? EditAgeTableViewCellItem {
            self.item = item
            
            //ageTextLabel.text = "\(item.dog?.ageYears ?? 0) год \(item.dog?.ageMonth ?? 0) месяцев"
            fullAgeTextLabel.text = "\(item.dog?.ageYears ?? 0) \(ageTextLabel.text ?? "лет") \(item.dog?.ageMonth ?? 0) \(monthTextLabel.text ?? "месяцев")"
            
        }
        // dog age
        self.item?.updateDogAgeYearsComplition = { age in
            self.ageLabel.text = "\(age)"
            self.fullAgeTextLabel.text = "\(self.ageLabel.text ?? "0") \(self.ageTextLabel.text ?? "лет") \(self.monthLabel.text ?? "0") \(self.monthTextLabel.text ?? "месяцев")"
            print(age)
        }
        self.item?.updateDogAgeMonthComplition = { age in
            self.monthLabel.text = "\(age)"
            self.fullAgeTextLabel.text = "\(self.ageLabel.text ?? "0") \(self.ageTextLabel.text ?? "лет") \(self.monthLabel.text ?? "0") \(self.monthTextLabel.text ?? "месяцев")"
            print(age)
        }
        
    }
    func addSubviews() {
        contentView.addSubview(ageLabelText)
        contentView.addSubview(fullAgeTextLabel)
        
        
    }
    func configureLayout() {
        ageLabelText.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(fullAgeTextLabel.snp.top).offset(-4.VAdapted)
        }
        fullAgeTextLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8.VAdapted)
        }
    }
    
    
    
    
}


