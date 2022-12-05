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
    // MARK: - Views
    var backgroundView = UIView()
    var rightBarButton = UIButton()
    var leftBarButton = UIButton()
    var familyImage = UIImageView()
    var leftButton = UIButton()
    var rightButton = UIButton()
    var documentsButton = UIButton()
    var layout = UICollectionViewFlowLayout()
    var currentPage = 0
    var myDogsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    // MARK: - Decorate
    func decorate() {
        self.backgroundColor = UIColor(red: 0.921, green: 0.921, blue: 0.921, alpha: 1)
        
        documentsButton.setTitle("Документы питомца", for: .normal)
        documentsButton.setTitleColor(.black, for: .normal)
        documentsButton.setImage(UIImage(named: "documentsIcon"), for: .normal)
        documentsButton.contentEdgeInsets.left = 10
        documentsButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        documentsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0)
        documentsButton.layer.cornerRadius = 15
        documentsButton.clipsToBounds = true
        documentsButton.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 0.4)
        documentsButton.setBackgroundColor(color: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), forState: .highlighted)
        documentsButton.titleLabel?.font = UIFont(name: "SFProText-Regular", size: 17)
        documentsButton.titleLabel?.attributedText = NSMutableAttributedString(string: "Документы питомца", attributes: [NSMutableAttributedString.Key.kern: -0.41])
        
        
        familyImage.image = UIImage(named: "familyImage")
        familyImage.contentMode = .scaleAspectFit
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 50
        
        backgroundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        rightBarButton.setImage(UIImage(named: "settingsBarButton"), for: .normal)
        
        leftBarButton.setImage(UIImage(named: "plusDogBarButton"), for: .normal)
        leftBarButton.setTitle("Питомец", for: .normal)
        leftBarButton.setTitle(NSLocalizedString("leftBarButtonMyDog", comment: ""), for: .normal)
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
       // leftBarButton.contentEdgeInsets.left = 10
        leftBarButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        leftBarButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 10)
        leftBarButton.layer.cornerRadius = 15
        leftBarButton.clipsToBounds = true
        leftBarButton.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 0.4)
        leftBarButton.setBackgroundColor(color: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), forState: .highlighted)
        leftBarButton.titleLabel?.attributedText = NSMutableAttributedString(string: "Питомец", attributes: [NSMutableAttributedString.Key.kern: -0.41])
       
        
        leftButton.setImage(UIImage(named: "leftButton"), for: .normal)
        rightButton.setImage(UIImage(named: "rightButton"), for: .normal)
       
        
        layout.scrollDirection = .horizontal
        
        myDogsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        myDogsCollectionView.backgroundColor = nil
        myDogsCollectionView.isPagingEnabled = true
        myDogsCollectionView.showsHorizontalScrollIndicator = false
        myDogsCollectionView.isScrollEnabled = true
    }
    // MARK: - Add Subviews
    func addSubviews() {
        self.addSubview(backgroundView)
        
        backgroundView.addSubview(myDogsCollectionView)
        backgroundView.addSubview(leftButton)
        backgroundView.addSubview(rightButton)
        backgroundView.addSubview(documentsButton)
        self.addSubview(familyImage)
    }
    // MARK: - Layout
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(0)
            make.centerX.equalToSuperview()
            make.size.equalTo([390, 370].HResized)
            
        }
        leftBarButton.snp.makeConstraints { make in
            make.size.equalTo([113, 34].HResized)
            
        }
        familyImage.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom).offset(-11.VAdapted)
            make.left.equalTo(self.snp.left).offset(54.HAdapted)
            make.right.equalTo(self.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(-83.VAdapted)
        }
        myDogsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(99.VAdapted)
//            make.left.equalTo(backgroundView.snp.left).offset(80.HAdapted)
//            make.right.equalTo(backgroundView.snp.right).offset(-80.HAdapted)
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-44.VAdapted)
            make.centerX.equalTo(self.snp.centerX)
            make.size.equalTo([230, 200].HResized)
            //make.height.equalTo(200.VAdapted)
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
        documentsButton.snp.makeConstraints { make in
            make.left.equalTo(backgroundView.snp.left).offset(87.HAdapted)
            make.right.equalTo(backgroundView.snp.right).offset(-87.HAdapted)
            make.height.equalTo(42.VAdapted)
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-31.VAdapted)
        }
    }
}

