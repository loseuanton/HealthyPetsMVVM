//
//  EditProfileDogView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 27.08.22.
//

import Foundation
import UIKit
import SnapKit


class EditProfileDogView: UIView {
    var backgroundView = UIView()
    var takingPicture = UIImagePickerController()
    var leftBarButton = UIButton()
    var rightBarButton = UIButton()
    var centralDogIcon = UIImageView()
    var photoIcon = UIImageView()
    var editProfileTableView = UITableView()
    var deleteProfileButton = UIButton()
    var pickerGender = UIPickerView()
    var pickerAge = UIPickerView()
    var constraint = NSLayoutConstraint()
    var statePickerAge = 0
    var statePickerGender = 0
    func decorate() {
        pickerGender.backgroundColor = .white
        pickerAge.backgroundColor = .white
        
       
       
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.tintColor = .black
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
        
        rightBarButton.setTitle("Готово", for: .normal)
        rightBarButton.tintColor = .black
        rightBarButton.setTitleColor(UIColor.black, for: .normal)
        rightBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
          
        
        centralDogIcon.image = UIImage(named: "centralPawIcon")
        centralDogIcon.layer.borderColor = UIColor(red: 0.82, green: 0.749, blue: 1, alpha: 1).cgColor
        centralDogIcon.layer.borderWidth = 4
        centralDogIcon.layer.cornerRadius = centralDogIcon.bounds.size.height / 2.0
        centralDogIcon.clipsToBounds = true
        centralDogIcon.contentMode = .scaleAspectFill
            
       
        photoIcon.image = UIImage(named: "photoIcon")
        photoIcon.layer.cornerRadius = photoIcon.bounds.size.height / 2.0
        photoIcon.clipsToBounds = true
        
        
        editProfileTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        editProfileTableView.layer.cornerRadius = 10
        editProfileTableView.clipsToBounds = true
        editProfileTableView.isScrollEnabled = false
        
        deleteProfileButton.setTitle("Удалить профиль", for: .normal)
        deleteProfileButton.setTitleColor(.red, for: .normal)
        deleteProfileButton.layer.cornerRadius = 10
        deleteProfileButton.clipsToBounds = true
        deleteProfileButton.backgroundColor = .white
        deleteProfileButton.setBackgroundColor(color: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), forState: .highlighted)
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        self.addSubview(pickerAge)
        self.addSubview(pickerGender)
        backgroundView.addSubview(centralDogIcon)
        backgroundView.addSubview(photoIcon)
        backgroundView.addSubview(editProfileTableView)
        backgroundView.addSubview(deleteProfileButton)
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        centralDogIcon.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(32.VAdapted)
            //make.left.equalTo(view).offset(160.HAdapted)
            //make.right.equalTo(view).offset(-160.HAdapted)
            make.centerX.equalToSuperview()
            make.size.equalTo([78,78].HResized)
        }
        photoIcon.snp.makeConstraints { make in
            make.top.equalTo(centralDogIcon.snp.top).offset(47.VAdapted)
            make.left.equalTo(centralDogIcon.snp.left).offset(47.HAdapted)
            make.size.equalTo([30, 30].HResized)
        }
        editProfileTableView.snp.makeConstraints { make in
            make.top.equalTo(centralDogIcon.snp.bottom).offset(32.VAdapted)
            make.size.equalTo([358, 240].HResized)
            make.centerX.equalToSuperview()
        }
        deleteProfileButton.snp.makeConstraints { make in
            make.top.equalTo(editProfileTableView.snp.bottom).offset(24.VAdapted)
            make.left.equalTo(backgroundView.snp.left).offset(16.HAdapted)
            make.right.equalTo(backgroundView.snp.right).offset(-16.HAdapted)
            make.height.equalTo(54.VAdapted)
        }
        pickerAge.snp.makeConstraints { make in
            make.height.equalTo(0.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
        }
        
        pickerGender.snp.makeConstraints { make in
            make.height.equalTo(0.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
        }
       
        
    }
    func changeStatePickerAge() {
        self.statePickerAge = (self.statePickerAge + 1) % 2
        UIView.animate(withDuration: 0.2) {
            self.updatePickerAgeConstraint()
            self.layoutIfNeeded()
        }
    }
    func updatePickerAgeConstraint() {
        if self.statePickerAge == 0 {
            pickerAge.snp.remakeConstraints { make in
                make.height.equalTo(0.VAdapted)
                make.left.equalTo(self.snp.left).offset(0.HAdapted)
                make.right.equalTo(self.snp.right).offset(0.HAdapted)
                make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
                
            }
        } else {
            pickerAge.snp.remakeConstraints { make in
                make.height.equalTo(216.VAdapted)
                make.left.equalTo(self.snp.left).offset(0.HAdapted)
                make.right.equalTo(self.snp.right).offset(0.HAdapted)
                make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            }
        }
    }
    func pickerAgeOff() {
        self.statePickerAge = 0
        UIView.animate(withDuration: 0.2) {
            self.closedPickerAge()
            self.layoutIfNeeded()
        }
    }
    func closedPickerAge() {
        pickerAge.snp.remakeConstraints { make in
            make.height.equalTo(0.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            
        }
    }
    
    func changeStatePickerGender() {
        self.statePickerGender = (self.statePickerGender + 1) % 2
        UIView.animate(withDuration: 0.2) {
            self.updatePickerGenderConstraint()
            self.layoutIfNeeded()
        }
    }
    func updatePickerGenderConstraint() {
        if self.statePickerGender == 0 {
            pickerGender.snp.remakeConstraints { make in
                make.height.equalTo(0.VAdapted)
                make.left.equalTo(self.snp.left).offset(0.HAdapted)
                make.right.equalTo(self.snp.right).offset(0.HAdapted)
                make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
                
            }
        } else {
            pickerGender.snp.remakeConstraints { make in
                make.height.equalTo(216.VAdapted)
                make.left.equalTo(self.snp.left).offset(0.HAdapted)
                make.right.equalTo(self.snp.right).offset(0.HAdapted)
                make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            }
        }
    }
    func pickerGenderOff() {
        self.statePickerGender = 0
        UIView.animate(withDuration: 0.2) {
            self.closedPickerGender()
            self.layoutIfNeeded()
        }
    }
    func closedPickerGender() {
        pickerGender.snp.remakeConstraints { make in
            make.height.equalTo(0.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            
        }
    }
}

