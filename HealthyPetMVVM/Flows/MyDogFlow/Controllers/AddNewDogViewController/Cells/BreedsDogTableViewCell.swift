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
        dogBreed.textColor = .black
        
        textLabel?.textColor = .black
        
        if let item = item as? BreedsDogTableViewCellItem {
            
            self.dogBreed.text = item.dog?.name
            
        }
        
    }
    func addSubviews() {
        contentView.addSubview(dogBreed)
        
    }
    func configureLayout() {
        dogBreed.snp.makeConstraints { make in
           
            make.left.equalTo(contentView.snp.left).offset(16.VAdapted)
            make.centerY.equalToSuperview()
            make.height.equalTo(22.VAdapted)
        }
    }
    
    
    
    
    
    
}

