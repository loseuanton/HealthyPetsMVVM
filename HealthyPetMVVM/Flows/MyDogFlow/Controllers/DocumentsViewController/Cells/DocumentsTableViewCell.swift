//
//  DocumentsTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.11.22.
//

import UIKit
import SnapKit

struct DocumentsTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "DocumentsTableViewCellItem"
    var documents: Documents?
    
    
}

class DocumentsTableViewCell: BaseTableViewCell {
    var item: DocumentsTableViewCellItem?
    var documentsLabel = UILabel()
    var documentsIcon = UIImageView()
    
    
    
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
        documentsLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "", letter: -0.41)
        
        
        if let item = item as? DocumentsTableViewCellItem {
           
            
            self.documentsLabel.text = item.documents?.passportAndMedicalBook
            self.documentsIcon.image = item.documents?.documentsIcon
            
        }
        
    }
    func addSubviews() {
        contentView.addSubview(documentsLabel)
        contentView.addSubview(documentsIcon)
        
    }
    func configureLayout() {
        documentsIcon.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.size.equalTo([35, 35].HResized)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        documentsLabel.snp.makeConstraints { make in
           
            make.left.equalTo(documentsIcon.snp.right).offset(8.VAdapted)
            make.centerY.equalToSuperview()
            make.height.equalTo(22.VAdapted)
        }
       
    }
    
    
    
    
    
    
}

