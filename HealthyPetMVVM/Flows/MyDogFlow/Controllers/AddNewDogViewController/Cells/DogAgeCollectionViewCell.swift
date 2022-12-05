//
//  DogAgeCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit
import SnapKit

class DogAgeCollectionViewCellItem: BaseConfigureCollectionCellRowProtocol {
    init(){}
    
    var cellIdentifier = "DogAgeCollectionViewCellItem"
    
    // dog age
    var updateDogAgeYearsComplition: ((Int) -> Void)?
    func updateDogAgeYears(age: Int) {
        updateDogAgeYearsComplition?(age)
    }
    
    var updateDogAgeMonthComplition: ((Int) -> Void)?
    func updateDogAgeMonth(age: Int) {
        updateDogAgeMonthComplition?(age)
    }
}

class DogAgeCollectionViewCell: BaseCollectionViewCell {
    var item: DogAgeCollectionViewCellItem?
   
    
    var dogAge = UILabel()
    var ageLabel = UILabel()
    var ageTextLabel = UILabel()
    var monthLabel = UILabel()
    var monthTextLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        
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
        dogAge.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 20, text: "Сколько лет вашему питомцу?", letter: 0.38)
        dogAge.font = UIFont.boldSystemFont(ofSize: 20)
        
        ageLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 20, text: "0", letter: 0.38)
        ageLabel.textAlignment = .center
        
        
        ageTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "Лет", letter: -0.24)
        ageTextLabel.textAlignment = .center
        ageTextLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        ageTextLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        monthLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 20, text: "0", letter: 0.38)
        monthLabel.textAlignment = .center
        
        monthTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "Месяцев", letter: -0.24)
        monthTextLabel.textAlignment = .center
        monthTextLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        monthTextLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        if let item = item as? DogAgeCollectionViewCellItem {
            self.item = item
        }
            // dog age
            self.item?.updateDogAgeYearsComplition = { age in
                self.ageLabel.text = "\(age)"
                print(age)
            }
            self.item?.updateDogAgeMonthComplition = { age in
                self.monthLabel.text = "\(age)"
                print(age)
            }
    }
    func addSubviews() {
        contentView.addSubview(dogAge)
        contentView.addSubview(ageLabel)
        contentView.addSubview(ageTextLabel)
        contentView.addSubview(monthLabel)
        contentView.addSubview(monthTextLabel)
        
    }
    func configureLayout() {
        dogAge.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24.VAdapted)
            make.centerX.equalToSuperview()
            make.height.equalTo(24.VAdapted)
        }
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(dogAge.snp.bottom).offset(72.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(125.HAdapted)
            make.size.equalTo([54, 24].HResized)
        }
        ageTextLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(6.VAdapted)
            make.size.equalTo([54, 20].HResized)
            make.centerX.equalTo(ageLabel.snp.centerX)
        }
        monthLabel.snp.makeConstraints { make in
            make.top.equalTo(dogAge.snp.bottom).offset(72.VAdapted)
            make.right.equalTo(contentView.snp.right).offset(-135.HAdapted)
            make.size.equalTo([52, 24].HResized)
        }
        monthTextLabel.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.bottom).offset(6.VAdapted)
            make.size.equalTo([64, 20].HResized)
            make.centerX.equalTo(monthLabel.snp.centerX)
        }
    }
}

