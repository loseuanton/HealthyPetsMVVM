//
//  HealthCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 15.08.22.
//

import Foundation
import UIKit
import SnapKit

struct HealthCollectionViewCellItem: BaseConfigureCollectionCellRowProtocol {
    var cellIdentifier = "HealthCollectionViewCellItem"
    var careArray: CareArray?
}

class HealthCollectionViewCell: BaseCollectionViewCell {
    var item: HealthCollectionViewCellItem?
    
    
    
    var careImageView = UIImageView()
    var careTextLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    private func configureCell() {
        addSubviews()
        configureLayout()
    }
    override func configure(item: BaseConfigureCollectionCellRowProtocol) {
        careImageView.contentMode = .scaleAspectFit
        careImageView.frame = contentView.bounds
        //contentView.backgroundColor = .white
        let whiteView = UIView(frame: bounds)
        whiteView.layer.cornerRadius = 20
        whiteView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        whiteView.layer.shadowRadius = 8
        whiteView.layer.shadowOpacity = 1
        whiteView.layer.shadowOffset = CGSize(width: 0, height: 3)
        whiteView.backgroundColor = .white
        self.backgroundView = whiteView
        
        let blackView = UIView(frame: bounds)
        blackView.layer.cornerRadius = 20
        blackView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        blackView.layer.shadowRadius = 8
        blackView.layer.shadowOpacity = 1
        blackView.layer.shadowOffset = CGSize(width: 0, height: 3)
        blackView.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18)
        self.selectedBackgroundView = blackView
        
        
       
        
        
        careTextLabel.numberOfLines = 0
        careTextLabel.font = UIFont(name: "SFPro-Regular", size: CGFloat(13).adaptedFontSize)
        careTextLabel.textColor = .black
        careTextLabel.textAlignment = .center
        careTextLabel.attributedText = NSMutableAttributedString(string: "", attributes: [NSMutableAttributedString.Key.kern: -0.08])
        careTextLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        if let item = item as? HealthCollectionViewCellItem {
            careTextLabel.text = item.careArray?.name
            careImageView.image = item.careArray?.image
        }
    }
    func addSubviews() {
        contentView.addSubview(careImageView)
        contentView.addSubview(careTextLabel)
    }
    func configureLayout() {
        
        careImageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
            make.size.equalTo([50, 50].HResized)
        }
        careTextLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(4.VAdapted)
            make.centerX.equalTo(contentView.snp.centerX)
            make.size.equalTo([109, 18].HResized)
        }
        
        
    }
    
}

