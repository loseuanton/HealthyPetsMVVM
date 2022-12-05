//
//  TypesOfServicesTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 17.11.22.
//

import UIKit
import SnapKit
import Cosmos

struct TypesOfServicesTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "TypesOfServicesTableViewCellItem"
    var typesOfServices: TypesOfServices?
    
}

class TypesOfServicesTableViewCell: BaseTableViewCell {
    var item: TypesOfServicesTableViewCellItem?
    var cellBackgroundView = UIView()
    var icon = UIImageView()
    var brendImage = UIImageView()
    var brendName = UILabel()
    var telefoneIcon = UIImageView()
    var number = UILabel()
    var starsView = CosmosView()
    
    
    
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
        icon.contentMode = .scaleAspectFit
        brendImage.contentMode = .scaleAspectFit
       
        //starsView.settings.updateOnTouch = false
        starsView.settings.filledImage = UIImage(named: "ratingStarFilled")?.withRenderingMode(.alwaysOriginal)
        starsView.settings.emptyImage = UIImage(named: "ratingStarEmpty")?.withRenderingMode(.alwaysOriginal)
        starsView.settings.totalStars = 5
        starsView.settings.starSize = 15
        starsView.settings.starMargin = 4.5
        starsView.settings.fillMode = .precise
        brendName.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 20, text: "", letter: 0.38)
        brendName.font = UIFont.boldSystemFont(ofSize: CGFloat(20).adaptedFontSize)
        
        telefoneIcon.image = UIImage(named: "telefoneIcon")
        number.textAlignment = .left
        
        if let item = item as? TypesOfServicesTableViewCellItem {
            
            self.icon.image = item.typesOfServices?.icon
            self.brendImage.image = item.typesOfServices?.brendImage
            self.brendName.text = item.typesOfServices?.brendName
            self.number.text = item.typesOfServices?.telefoneNumber
            self.starsView.rating = item.typesOfServices?.ratingStars ?? 0
            
            
            
        }
    }
    
    
    
    func addSubviews() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(icon)
        icon.addSubview(brendImage)
        cellBackgroundView.addSubview(brendName)
        cellBackgroundView.addSubview(starsView)
        cellBackgroundView.addSubview(telefoneIcon)
        cellBackgroundView.addSubview(number)
        
        
    }
    func configureLayout() {
        cellBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.right.equalTo(contentView.snp.right).inset(16.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).inset(8)
            make.height.equalTo(272.VAdapted)
        }
        icon.snp.makeConstraints { make in
            make.top.equalTo(cellBackgroundView.snp.top).offset(16.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.right.equalTo(cellBackgroundView.snp.right).inset(16.HAdapted)
            make.height.equalTo(168.VAdapted)
        }
        brendImage.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.top)
            make.left.equalTo(icon.snp.left)
        }
        brendName.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(8.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.right.equalTo(cellBackgroundView.snp.right).inset(16.HAdapted)
            make.height.equalTo(24.VAdapted)
        }
        starsView.snp.makeConstraints { make in
            make.top.equalTo(brendName.snp.bottom).offset(6.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            
            make.height.equalTo(15.VAdapted)
        }
        
        telefoneIcon.snp.makeConstraints { make in
            make.top.equalTo(starsView.snp.bottom).offset(6.VAdapted)
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.size.equalTo([21, 21].HResized)
        }
        number.snp.makeConstraints { make in
            make.centerY.equalTo(telefoneIcon.snp.centerY)
            make.left.equalTo(telefoneIcon.snp.right).offset(4.HAdapted)
            make.right.equalTo(cellBackgroundView.snp.right).inset(16.HAdapted)
            make.height.equalTo(24.VAdapted)
        }
    }
    
    
    
    
    
    
}
