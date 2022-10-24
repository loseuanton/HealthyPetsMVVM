//
//  BreedsDogTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 12.08.22.
//

import UIKit
import SnapKit

struct BreedsDogTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "BreedsDogTableViewCellItem"
    var dog: Dogs?
    
    
}

class BreedsDogTableViewCell: BaseTableViewCell {
    var item: BreedsDogTableViewCellItem?
    var dogBreed = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       // contentView.backgroundColor = .white
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
        dogBreed.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "", letter: -0.41)
        
        
        
        if let item = item as? BreedsDogTableViewCellItem {
            
            self.dogBreed.text = item.dog?.name
            
        }
        
    }
    func selectCell() {
        self.accessoryType = .checkmark
        self.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        dogBreed.textColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
    }
    
    func deselectCell() {
        self.accessoryType = .none
        self.tintColor = .black
        dogBreed.textColor = .black
    }
    func addSubviews() {
        contentView.addSubview(dogBreed)
        
    }
    func configureLayout() {
        dogBreed.snp.makeConstraints { make in
           
            make.left.equalTo(contentView.snp.left).offset(16.VAdapted)
            make.right.equalTo(contentView.snp.right).offset(16.VAdapted)
            make.centerY.equalToSuperview()
            make.height.equalTo(22.VAdapted)
        }
    }
    
    
    
    
    
    
}

