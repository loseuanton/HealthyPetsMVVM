//
//  EditNicknameCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 24.09.22.
//

import Foundation
import UIKit
import SnapKit

struct EditNicknameTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "EditNicknameTableViewCellItem"
    var changeEditDogName: ((String) -> Void)?
    var dog: NewDog?
}

class EditNicknameTableViewCell: BaseTableViewCell {
    var item: EditNicknameTableViewCellItem?
    var nameTextField = UITextField()
    var nicknameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        configureCell()
        
    }
    @objc func changeEditDogName() {
        self.item?.changeEditDogName?(nameTextField.text ?? "Акира")
        
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
        nameTextField.font = UIFont(name: "SFProText-Regular", size: CGFloat(17).adaptedFontSize)
        nameTextField.text = "кличка"
        nameTextField.textColor = .black
        nameTextField.addTarget(self, action: #selector(changeEditDogName), for: .editingChanged)
        
        
        nicknameLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "Кличка", letter: -0.08)
        nicknameLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        nicknameLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        if let item = item as? EditNicknameTableViewCellItem {
            self.item = item
            //nameTextField.text = item.dog?.name
            nameTextField.text = item.dog?.copyNewDog().name
        }
    }
    func addSubviews() {
        contentView.addSubview(nameTextField)
        contentView.addSubview(nicknameLabel)
        
        
    }
    func configureLayout() {
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(4.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8.VAdapted)
        }
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(nameTextField.snp.top).offset(-4.VAdapted)
        }
    }
    
    
    
    
}

