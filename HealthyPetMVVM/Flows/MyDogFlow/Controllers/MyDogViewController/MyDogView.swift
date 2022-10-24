//
//  MyDogView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 9.08.22.
//

import Foundation
import UIKit
import SnapKit


class MyDogView: UIView {
    var backgroundView = UIView()
    var rightBarButton = UIButton()
    var leftBarButton = UIButton()
    var familyImage = UIImageView()
    var leftButton = UIButton()
    var rightButton = UIButton()
    var layout = UICollectionViewFlowLayout()
    var currentPage = 0
    var myDogsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    func decorate() {
        self.backgroundColor = UIColor(red: 0.921, green: 0.921, blue: 0.921, alpha: 1)
        
        familyImage.image = UIImage(named: "familyImage")
        familyImage.contentMode = .scaleAspectFit
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 50
        
        backgroundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        rightBarButton.setImage(UIImage(named: "settingsBarButton"), for: .normal)
        
        
        leftBarButton.setImage(UIImage(named: "plusDogBarButton"), for: .normal)
        leftBarButton.setTitle(" Собака", for: .normal)
        leftBarButton.setTitle(NSLocalizedString("leftBarButtonMyDog", comment: ""), for: .normal)
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.layer.cornerRadius = 15
        leftBarButton.clipsToBounds = true
        leftBarButton.setTitleColor(UIColor.blue, for: .selected)
        leftBarButton.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 0.4)
        
        leftButton.setImage(UIImage(named: "leftButton"), for: .normal)
        rightButton.setImage(UIImage(named: "rightButton"), for: .normal)
       
        
        layout.scrollDirection = .horizontal
        
        myDogsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        myDogsCollectionView.backgroundColor = nil
        myDogsCollectionView.isPagingEnabled = true
        myDogsCollectionView.showsHorizontalScrollIndicator = false
        myDogsCollectionView.isScrollEnabled = false
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        
        backgroundView.addSubview(myDogsCollectionView)
        backgroundView.addSubview(leftButton)
        backgroundView.addSubview(rightButton)
        self.addSubview(familyImage)
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(0)
            make.centerX.equalToSuperview()
            make.size.equalTo([390, 312].HResized)
            
        }
        leftBarButton.snp.makeConstraints { make in
            make.size.equalTo([99, 34].HResized)
        }
        familyImage.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom).offset(-7.VAdapted)
            make.left.equalTo(self.snp.left).offset(32.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(-83.VAdapted)
        }
        myDogsCollectionView.snp.makeConstraints { make in
            make.left.equalTo(backgroundView).offset(80.HAdapted)
            make.right.equalTo(backgroundView).offset(-80.HAdapted)
            make.bottom.equalTo(backgroundView).offset(-14.VAdapted)
            make.height.equalTo(200.VAdapted)
        }
        leftButton.snp.makeConstraints { make in
            make.left.equalTo(backgroundView.snp.left).offset(16.HAdapted)
            make.centerY.equalTo(backgroundView.snp.centerY)
            make.size.equalTo([50, 50].HResized)
        }
        rightButton.snp.makeConstraints { make in
            make.right.equalTo(backgroundView.snp.right).offset(-16.HAdapted)
            make.centerY.equalTo(backgroundView.snp.centerY)
            make.size.equalTo([50, 50].HResized)
        }
    }
}

