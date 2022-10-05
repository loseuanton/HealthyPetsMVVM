//
//  MyDogsCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit
import SnapKit
import RealmSwift

struct MyDogsCollectionViewCellItem: BaseConfigureCollectionCellRowProtocol {
    var cellIdentifier = "MyDogsCollectionViewCellItem"
    var newDog: NewDog?
    
    
}

class MyDogsCollectionViewCell: BaseCollectionViewCell {
    var item: MyDogsCollectionViewCellItem?
    
    
    
    var nicknameLabel =  UILabel()
    var breedLabel = UILabel()
    var ageLabel = UILabel()
    var centralDogIcon = UIImageView()
    var ageText = UILabel()
    
    
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
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    private func configureCell() {
        addSubviews()
        configureLayout()
    }
    override func configure(item: BaseConfigureCollectionCellRowProtocol) {
        
        nicknameLabel.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 20, text: "Акира", letter: 0.38)
        nicknameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nicknameLabel.textAlignment = .center
        
        breedLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "Сиба-ину (Шиба-ину)", letter: -0.24)
        breedLabel.textColor = UIColor(displayP3Red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
        breedLabel.textAlignment = .center
        
        ageLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "1 год 11 месяцев", letter: -0.24)
        ageLabel.textColor = UIColor(displayP3Red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
        ageLabel.textAlignment = .center
        
        
        centralDogIcon.image = UIImage(named: "centralPawIcon")
        centralDogIcon.contentMode = .scaleAspectFill
        centralDogIcon.layer.borderColor = UIColor(red: 0.82, green: 0.749, blue: 1, alpha: 0.4).cgColor
        //centralDogIcon.bounds = centralDogIcon.bounds.insetBy(dx: -4, dy: -4)
        centralDogIcon.layer.borderWidth = 4
        centralDogIcon.layer.cornerRadius = centralDogIcon.bounds.size.height / 2.0
        centralDogIcon.clipsToBounds = true
        
        if let item = item as? MyDogsCollectionViewCellItem {
            self.item = item
            nicknameLabel.text = item.newDog?.name
            breedLabel.text = item.newDog?.breed
            if item.newDog?.ageYears == 1 {
                ageText.text = "год"
            } else if item.newDog?.ageYears == 2 {
                ageText.text = "года"
            } else {
                ageText.text = "лет"
            }
            ageLabel.text = "\(String(describing: item.newDog?.ageYears ?? 0)) \(ageText.text ?? "лет") \(String(describing: item.newDog?.ageMonth ?? 0)) месяцев"
            centralDogIcon.image = UIImage(data: item.newDog!.imageDog as Data)
            
            
            
        }
        
    }
    func addSubviews() {
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(breedLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(centralDogIcon)
    }
    func configureLayout() {
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(0.VAdapted)
            make.left.equalTo(contentView).offset(0.HAdapted)
            make.right.equalTo(contentView).offset(0.HAdapted)
            make.centerX.equalToSuperview()
        }
        breedLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(8.VAdapted)
            make.left.equalTo(contentView).offset(0.HAdapted)
            make.right.equalTo(contentView).offset(0.HAdapted)
            make.centerX.equalToSuperview()
        }
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(breedLabel.snp.bottom).offset(8.VAdapted)
            make.left.equalTo(contentView).offset(0.HAdapted)
            make.right.equalTo(contentView).offset(0.HAdapted)
            make.centerX.equalToSuperview()
        }
        centralDogIcon.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(24.VAdapted)
            make.centerX.equalToSuperview()
            make.size.equalTo([70,70].HResized)
        }
        
        
    }
}

