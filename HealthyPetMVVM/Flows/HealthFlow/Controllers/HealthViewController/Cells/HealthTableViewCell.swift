//
//  HealthTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.10.22.
//

import UIKit
import SnapKit

struct HealthTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "HealthTableViewCellItem"
    
    
    
}

class HealthTableViewCell: BaseTableViewCell {
    var item: HealthTableViewCellItem?
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
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
        self.textLabel?.text = "gg"
        
        
        
        if let item = item as? HealthTableViewCellItem {
            self.item = item
            
            
        }
        
    }
    func addSubviews() {
        
        
    }
    func configureLayout() {
       
    }
 
}

