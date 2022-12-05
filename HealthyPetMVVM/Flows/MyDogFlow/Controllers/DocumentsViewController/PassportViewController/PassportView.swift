//
//  PassportView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.11.22.
//

import Foundation
import UIKit
import SnapKit



class PassportView: UIView {
    // MARK: - Views
    var backgroundView = UIView()
    var leftBarButton = UIButton()
    var rightBarButton = UIButton()
    var passportImage = UIImageView()
    var takingPicture = UIImagePickerController()
    
   
   
    // MARK: - Decorate Views
    func decorate() {
        passportImage.image = UIImage(named: "noRemindersIcon")
       
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
        leftBarButton.tintColor = .black
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        
        rightBarButton.setTitle("Готово", for: .normal)
        rightBarButton.tintColor = .black
        rightBarButton.setTitleColor(UIColor.black, for: .normal)
        rightBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
        
    }
    // MARK: - Add Subviews
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(passportImage)
        
    }
    // MARK: - Layout
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        passportImage.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(122.VAdapted)
            make.left.equalTo(backgroundView.snp.left).offset(16.HAdapted)
            make.right.equalTo(backgroundView.snp.right).offset(-16.HAdapted)
            make.size.equalTo([358, 341].HResized)
        }
       
        
    }
}


