//
//  RateUsAndPrivacyPolicyTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 11.09.22.
//

import UIKit
import SnapKit

struct RateUsAndPrivacyPolicyTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "RateUsAndPrivacyPolicyTableViewCellItem"
    var rateUsAndPrivacyPolicy: RateUsAndPrivacyPolicy?
    
    
}

class RateUsAndPrivacyPolicyTableViewCell: BaseTableViewCell {
    var item: RateUsAndPrivacyPolicyTableViewCellItem?
    var rateUsAndPrivacyPolicy = UILabel()
    
    
    
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
        rateUsAndPrivacyPolicy.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "", letter: -0.41)
        
        
        if let item = item as? RateUsAndPrivacyPolicyTableViewCellItem {
            
            self.rateUsAndPrivacyPolicy.text = item.rateUsAndPrivacyPolicy?.rateUsAndPrivacyPolicy
           
            
        }
        
    }
    func addSubviews() {
        contentView.addSubview(rateUsAndPrivacyPolicy)
        
    }
    func configureLayout() {
        rateUsAndPrivacyPolicy.snp.makeConstraints { make in
           
            make.left.equalTo(contentView.snp.left).offset(16.VAdapted)
            make.centerY.equalToSuperview()
            make.height.equalTo(22.VAdapted)
        }
       
    }
    
    
    
    
    
    
}

