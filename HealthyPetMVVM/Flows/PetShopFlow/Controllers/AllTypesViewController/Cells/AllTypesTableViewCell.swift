//
//  AllTypesTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 22.11.22.
//

import UIKit
import SnapKit

struct AllTypesTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "AllTypesTableViewCellItem"
    var typeServices: AllTypes?
    
}

class AllTypesTableViewCell: BaseTableViewCell {
    var item: AllTypesTableViewCellItem?
    var cellBackgroundView = UIView()
    var nameServices = UILabel()
    var adress = UILabel()
    var workingTime = UILabel()
    var telefoneIcon = UIImageView()
    var telefoneNumber = UILabel()
    
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
        self.backgroundColor = .clear
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.layer.cornerRadius = 10
        
        nameServices.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 22, text: "", letter: -0.41)
        nameServices.font = UIFont.boldSystemFont(ofSize: CGFloat(22).adaptedFontSize)
        
        adress.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "", letter: -0.08)
        
        workingTime.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "", letter: -0.08)
        workingTime.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        telefoneIcon.image = UIImage(named: "telefoneIcon")
        
        telefoneNumber.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "", letter: -0.24)
        
        if let item = item as? AllTypesTableViewCellItem {
            self.item = item
            self.nameServices.text = item.typeServices?.name
            self.adress.text = item.typeServices?.adress
            self.workingTime.text = item.typeServices?.workingTime
            self.telefoneNumber.text = item.typeServices?.telefoneNumber
            
            
        }
    }
    
    func addSubviews() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(nameServices)
        cellBackgroundView.addSubview(adress)
        cellBackgroundView.addSubview(workingTime)
        cellBackgroundView.addSubview(telefoneIcon)
        cellBackgroundView.addSubview(telefoneNumber)
    }
    func configureLayout() {
        cellBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.top.equalTo(contentView.snp.top).offset(4)
            make.right.equalTo(contentView.snp.right).inset(16.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).inset(4)
            make.height.equalTo(107.VAdapted)
        }
        nameServices.snp.makeConstraints { make in
            make.top.equalTo(cellBackgroundView.snp.top).offset(8.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.height.equalTo(22.VAdapted)
        }
        adress.snp.makeConstraints { make in
            make.top.equalTo(nameServices.snp.bottom).offset(4.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.height.equalTo(18.VAdapted)
        }
        workingTime.snp.makeConstraints { make in
            make.top.equalTo(adress.snp.bottom).offset(4.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.height.equalTo(18.VAdapted)
        }
        telefoneIcon.snp.makeConstraints { make in
            make.top.equalTo(workingTime.snp.bottom).offset(4.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.size.equalTo([21, 21].HResized)
        }
        telefoneNumber.snp.makeConstraints { make in
            make.centerY.equalTo(telefoneIcon.snp.centerY)
            make.left.equalTo(telefoneIcon.snp.right).offset(2.HAdapted)
            make.height.equalTo(20.VAdapted)
        }
       
        
        
    }
    
    
    
    
    
    
}
