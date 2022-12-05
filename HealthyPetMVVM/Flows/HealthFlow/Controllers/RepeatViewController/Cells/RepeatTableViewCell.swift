//
//  RepeatTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 19.09.22.
//

import UIKit
import SnapKit

struct RepeatTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "RepeatTableViewCellItem"
    var repeats: Repeat?
    
    
}

class RepeatTableViewCell: BaseTableViewCell {
    var item: RepeatTableViewCellItem?
    var repeats = UILabel()
    
    
    
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
        repeats.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "", letter: -0.41)
        
        
        
        if let item = item as? RepeatTableViewCellItem {
            
            self.repeats.text = item.repeats?.repeats
            
        }
        
    }
    func selectCell() {
        self.accessoryType = .checkmark
        self.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        repeats.textColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
    }
    
    func deselectCell() {
        self.accessoryType = .none
        self.tintColor = .black
        repeats.textColor = .black
    }
    func addSubviews() {
        contentView.addSubview(repeats)
        
        
    }
    func configureLayout() {
        repeats.snp.makeConstraints { make in
           
            make.left.equalTo(contentView.snp.left).offset(16.VAdapted)
            make.centerY.equalToSuperview()
            make.height.equalTo(22.VAdapted)
        }
       
    }
    
    
    
    
    
    
}

