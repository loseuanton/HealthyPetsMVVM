//
//  AddNewDogView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit
import SnapKit

class AddNewDogView: UIView {
    var takingPicture = UIImagePickerController()
    var picker = UIPickerView()
    var backgroundView = UIView()
    var leftBarButton = UIButton()
    let pageControl =  UIPageControl()
    var bgViewForPageControl =  UIView()
    var leftButtonForPageControl =  UIButton()
    var rightButtonForPageControl =  UIButton()
    var layout =  UICollectionViewFlowLayout()
    var currentPage = 0
    var newDogCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    func decorate() {
        self.backgroundColor = UIColor(red: 0.921, green: 0.921, blue: 0.921, alpha: 1)
        
        picker.backgroundColor = .white
        
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        //leftBarButton.setImage(UIImage(named: "chevronLeft"), for: .normal)
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.tintColor = .black
        leftBarButton.layer.cornerRadius = 15
        leftBarButton.clipsToBounds = true
        leftBarButton.setTitleColor(UIColor.blue, for: .selected)
        leftBarButton.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 0.4)
        
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        pageControl.pageIndicatorTintColor = .white
        pageControl.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        bgViewForPageControl.layer.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 0.4).cgColor
        
        leftButtonForPageControl.setImage(UIImage(named: "leftButtonPageControll"), for: .normal)
        rightButtonForPageControl.setImage(UIImage(named: "rightButtonPageControll"), for: .normal)
        
        layout.scrollDirection = .horizontal
        
        newDogCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        newDogCollectionView.backgroundColor = nil
        newDogCollectionView.isPagingEnabled = true
        newDogCollectionView.showsHorizontalScrollIndicator = false
        newDogCollectionView.isScrollEnabled = false
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(leftBarButton)
        backgroundView.addSubview(pageControl)
        backgroundView.addSubview(bgViewForPageControl)
        backgroundView.addSubview(rightButtonForPageControl)
        backgroundView.addSubview(leftButtonForPageControl)
        backgroundView.addSubview(newDogCollectionView)
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0.VAdapted)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-316.VAdapted)
           
        }
        
        leftBarButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(55.VAdapted)
            make.left.equalTo(self.snp.left).offset(16.HAdapted)
            make.size.equalTo([99, 34].HResized)
        }
        pageControl.snp.makeConstraints { make in
            //make.bottom.equalTo(backgroundView.snp.bottom).offset(-41.VAdapted)
            make.centerX.equalTo(bgViewForPageControl.snp.centerX)
            make.centerY.equalTo(bgViewForPageControl.snp.centerY)
            make.size.equalTo([150, 28].HResized)
        }
        bgViewForPageControl.snp.makeConstraints { make in
            //make.bottom.equalTo(backgroundView.snp.bottom).offset(-41.VAdapted)
            make.centerX.equalTo(backgroundView.snp.centerX)
            make.top.equalTo(newDogCollectionView.snp.bottom).offset(33.VAdapted)
            make.size.equalTo([82, 28].HResized)
        }
        leftButtonForPageControl.snp.makeConstraints { make in
            make.right.equalTo(bgViewForPageControl.snp.left).offset(-32.HAdapted)
            make.centerY.equalTo(bgViewForPageControl.snp.centerY)
            make.size.equalTo([50, 50].HResized)
        }
        rightButtonForPageControl.snp.makeConstraints { make in
            make.left.equalTo(bgViewForPageControl.snp.right).offset(32.HAdapted)
            make.centerY.equalTo(bgViewForPageControl.snp.centerY)
            make.size.equalTo([50, 50].HResized)
        }
        newDogCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(86.VAdapted)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-102.VAdapted)
            make.size.equalTo([390, 340].HResized)
        }
    }
    
    
}
