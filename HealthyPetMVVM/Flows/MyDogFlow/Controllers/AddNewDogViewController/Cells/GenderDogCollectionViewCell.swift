//
//  GenderDogCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit
import SnapKit

struct GenderDogCollectionViewCellItem: BaseConfigureCollectionCellRowProtocol {
    var cellIdentifier = "GenderDogCollectionViewCellItem"
    var changeDogGender: ((String) -> Void)?
}

class GenderDogCollectionViewCell: BaseCollectionViewCell {
    var item: GenderDogCollectionViewCellItem?
    
    var dogGender = UILabel()
    var maleButton = UIButton()
    var femaleButton = UIButton()
    var genderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        
    }
    @objc func changeDogGender() {
       self.item?.changeDogGender?(genderLabel.text ?? "Мужской")
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
        dogGender.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 20, text: "Какого пола ваша собака?", letter: 0.38)
        dogGender.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        maleButton.layer.borderColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18).cgColor
        maleButton.layer.borderWidth = 1
        maleButton.layer.cornerRadius = 15
        maleButton.clipsToBounds = true
        maleButton.setAttributedTitle(NSAttributedString(string: "Мужской", attributes: [NSMutableAttributedString.Key.kern: -0.41]), for: .normal)
        maleButton.setTitleColor(.black, for: .normal)
        maleButton.addTarget(self, action: #selector(maleButtonDidTap), for: .touchUpInside)
        maleButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        maleButton.contentVerticalAlignment = .bottom
        maleButton.setBackgroundImage(UIImage(named: "maleGender"), for: .normal)
        
        femaleButton.layer.borderColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18).cgColor
        femaleButton.layer.borderWidth = 1
        femaleButton.layer.cornerRadius = 15
        femaleButton.clipsToBounds = true
        femaleButton.setAttributedTitle(NSAttributedString(string: "Женский", attributes: [NSMutableAttributedString.Key.kern: -0.41]), for: .normal)
        femaleButton.setTitleColor(.black, for: .normal)
        femaleButton.addTarget(self, action: #selector(femaleButtonDidTap), for: .touchUpInside)
        femaleButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        femaleButton.contentVerticalAlignment = .bottom
        femaleButton.setBackgroundImage(UIImage(named: "feminineGender"), for: .normal)
        if let item = item as? GenderDogCollectionViewCellItem {
            self.item = item
        }
    }
    func addSubviews() {
        contentView.addSubview(dogGender)
        contentView.addSubview(maleButton)
        contentView.addSubview(femaleButton)
        
        
    }
    func configureLayout() {
        dogGender.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24.VAdapted)
            make.centerX.equalToSuperview()
            make.height.equalTo(24.VAdapted)
        }
        maleButton.snp.makeConstraints { make in
            make.top.equalTo(dogGender.snp.bottom).offset(64.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(87.HAdapted)
            make.size.equalTo([100, 100].HResized)
            make.right.equalTo(femaleButton.snp.left).offset(-16.HAdapted)
        }
        femaleButton.snp.makeConstraints { make in
            make.top.equalTo(dogGender.snp.bottom).offset(64.VAdapted)
            make.right.equalTo(contentView.snp.right).offset(-87.HAdapted)
            make.size.equalTo([100, 100].HResized)
        }
        
        
    }
    @objc func maleButtonDidTap() {
        if maleButton.isSelected == true {
            maleButton.backgroundColor = .clear
            maleButton.isSelected = false
        
        } else if !maleButton.isSelected == true {
            maleButton.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18)
            genderLabel.text = "Мужской"
            self.item?.changeDogGender?(genderLabel.text ?? "")
            femaleButton.backgroundColor = .clear
            femaleButton.isSelected = false
            maleButton.isSelected = true
        }
        
           
    }
    @objc func femaleButtonDidTap() {
        if femaleButton.isSelected == true {
            femaleButton.backgroundColor = .clear
            femaleButton.isSelected = false
        
        } else if !femaleButton.isSelected == true {
            femaleButton.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18)
            genderLabel.text = "Женский"
            self.item?.changeDogGender?(genderLabel.text ?? "")
            maleButton.backgroundColor = .clear
            maleButton.isSelected = false
            femaleButton.isSelected = true
        }
        
           
    }
}

