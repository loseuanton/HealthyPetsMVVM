//
//  NicknameDogCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit
import SnapKit

struct NicknameDogCollectionViewCellItem: BaseConfigureCollectionCellRowProtocol {
    var cellIdentifier = "NicknameDogCollectionViewCellItem"
    var changeDogName: ((String) -> Void)?
    var changeDogImage: (( ((UIImage?) -> Void)? )  -> Void)?
    var saveDogImage: ((UIImage?) -> Void)?
}

class NicknameDogCollectionViewCell: BaseCollectionViewCell, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var item: NicknameDogCollectionViewCellItem?
    
    var ourDogName = UILabel()
    var centralDogIcon = UIImageView()
    var addNewDogText = UILabel()
    var notNecessaryText = UILabel()
    var nameTextField = UITextField()
    var takingPicture = UIImagePickerController()
   

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        
    }
    
    @objc func changeDogName() {
        self.item?.changeDogName?(nameTextField.text ?? "Акира")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    private func configureCell() {
        addSubviews()
        configureLayout()
    }
    override func configure(item: BaseConfigureCollectionCellRowProtocol) {
        ourDogName.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 20, text: "Как зовут вашу собаку?", letter: 0.38)
        ourDogName.font = UIFont.boldSystemFont(ofSize: CGFloat(20).adaptedFontSize)
        ourDogName.text = NSLocalizedString("ourDogName", comment: "")
        
        
        centralDogIcon.image = UIImage(named: "centralPawIcon")
        centralDogIcon.layer.borderColor = UIColor(red: 0.82, green: 0.749, blue: 1, alpha: 1).cgColor
        centralDogIcon.contentMode = .scaleAspectFill
        
        centralDogIcon.layer.borderWidth = 4
        //centralDogIcon.layer.cornerRadius = centralDogIcon.bounds.size.height / 2.0
        centralDogIcon.layer.cornerRadius = 39
       
        //centralDogIcon.bounds = centralDogIcon.bounds.insetBy(dx: -4, dy: -4)
        centralDogIcon.clipsToBounds = true
        centralDogIcon.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openAlertPhoto))
        centralDogIcon.addGestureRecognizer(tapGesture)
        
        addNewDogText.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Добавьте фото собаки", letter: -0.41)
        addNewDogText.text = NSLocalizedString("addNewDogText", comment: "")
        
        notNecessaryText.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "Необязательно", letter: -0.08)
        notNecessaryText.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        notNecessaryText.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        notNecessaryText.text = NSLocalizedString("notNecessaryText", comment: "")
        nameTextField.delegate = self
        nameTextField.placeholder = "Акира"
        nameTextField.placeholder = NSLocalizedString("nameTextField", comment: "")
        nameTextField.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        nameTextField.textAlignment = .center
        nameTextField.font = UIFont(name: "", size: CGFloat(17).adaptedFontSize)
        nameTextField.addTarget(self, action: #selector(changeDogName), for: .editingChanged)
        if let item = item as? NicknameDogCollectionViewCellItem {
            self.item = item
            self.item?.saveDogImage?(centralDogIcon.image)
        }
    }
   
    func addSubviews() {
        contentView.addSubview(ourDogName)
        contentView.addSubview(centralDogIcon)
        contentView.addSubview(addNewDogText)
        contentView.addSubview(notNecessaryText)
        contentView.addSubview(nameTextField)
        
        
    }
    
    func configureLayout() {
        ourDogName.snp.makeConstraints { make in
            make.top.equalTo(notNecessaryText.snp.bottom).offset(45.VAdapted)
            make.centerX.equalToSuperview()
            make.height.equalTo(24.VAdapted)
        }
       
        centralDogIcon.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(32.HAdapted)
            make.size.equalTo([78, 78].HResized)
        }
        addNewDogText.snp.makeConstraints { make in
            make.left.equalTo(centralDogIcon.snp.right).offset(16.HAdapted)
            make.top.equalTo(contentView.snp.top).offset(37.VAdapted)
            make.height.equalTo(22.VAdapted)
        }
        notNecessaryText.snp.makeConstraints { make in
            make.left.equalTo(centralDogIcon.snp.right).offset(16.HAdapted)
            make.top.equalTo(addNewDogText.snp.bottom).offset(4.VAdapted)
            make.height.equalTo(18.VAdapted)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(ourDogName.snp.bottom).offset(48.VAdapted)
            make.size.equalTo([212, 22].HResized)
            make.centerX.equalToSuperview()
        }
        
        
    }
    @objc func openAlertPhoto(sender: UITapGestureRecognizer) {
        
        let recetImageComplition: ((UIImage?) -> Void)? = { [weak self] image in
            self?.centralDogIcon.image = image
            self?.item?.saveDogImage?(self?.centralDogIcon.image ?? UIImage(named: "centralPawIcon"))
        }
        
        item?.changeDogImage?(recetImageComplition)
       
    }
}
extension NicknameDogCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}
