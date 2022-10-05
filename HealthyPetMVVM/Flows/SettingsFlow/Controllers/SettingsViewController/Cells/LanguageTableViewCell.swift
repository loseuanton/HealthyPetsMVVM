//
//  LanguageTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 11.09.22.
//

import UIKit
import SnapKit

struct LanguageTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "LanguageTableViewCellItem"
    var language: Language?
    
    
}

class LanguageTableViewCell: BaseTableViewCell {
    var item: LanguageTableViewCellItem?
    var language = UILabel()
    var selectedLanguage = UILabel()
    
    
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
        language.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Язык", letter: -0.41)
        selectedLanguage.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Русский", letter: -0.41)
        selectedLanguage.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        
        if let item = item as? LanguageTableViewCellItem {
            self.item = item
            //self.language.text = item.language?.language
            //self.selectedLanguage.text = item.language?.selectedLanguage
            
        }
        
    }
    func addSubviews() {
        contentView.addSubview(language)
        contentView.addSubview(selectedLanguage)
        
    }
    func configureLayout() {
        language.snp.makeConstraints { make in
           
            make.left.equalTo(contentView.snp.left).offset(16.VAdapted)
            make.centerY.equalToSuperview()
            make.height.equalTo(22.VAdapted)
        }
        selectedLanguage.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-8.VAdapted)
            make.centerY.equalToSuperview()
            make.height.equalTo(22.VAdapted)
        }
    }
    
    
    
    
    
    
}
