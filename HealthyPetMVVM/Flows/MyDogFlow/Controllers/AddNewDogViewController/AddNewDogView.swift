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
    var leftDogImage = UIImageView()
    var rightDogImage = UIImageView()
    var textForPickerView = UILabel()
    var breedText: String?
    var currentPage = 0
    var statePicker = 0
    var newDogCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    func decorate() {
        
        textForPickerView.customBlackText(nameFont: "SFProDisplay-Regular", sizeFont: 23, text: "", letter: 0.7)
        //textForPickerView.textAlignment = .left
        
        self.backgroundColor = UIColor(red: 0.921, green: 0.921, blue: 0.921, alpha: 1)
        
        picker.backgroundColor = .white
        
        leftDogImage.image = UIImage(named: "leftDogImage")
        leftDogImage.contentMode = .scaleAspectFit
        rightDogImage.image = UIImage(named: "rightDogImage")
        rightDogImage.contentMode = .scaleAspectFill
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        //leftBarButton.setImage(UIImage(named: "chevronLeft"), for: .normal)
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.setTitle(NSLocalizedString("leftBarButton", comment: ""), for: .normal)
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.tintColor = .black
        leftBarButton.layer.cornerRadius = 15
        leftBarButton.clipsToBounds = true
        leftBarButton.setTitleColor(UIColor.blue, for: .selected)
        leftBarButton.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 0.4)
        leftBarButton.setBackgroundColor(color: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), forState: .highlighted)
        
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
        newDogCollectionView.isPagingEnabled = false
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
        self.addSubview(leftDogImage)
        self.addSubview(rightDogImage)
        self.addSubview(picker)
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
        leftDogImage.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            make.size.equalTo([128, 191].HResized)
        }
        rightDogImage.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(backgroundView.snp.bottom).offset(24.VAdapted)
            make.left.equalTo(leftDogImage.snp.right).offset(113.HAdapted)
            make.height.equalTo(292.VAdapted)
            //make.size.equalTo([149, 292].HResized)
            
        }
        
        picker.snp.makeConstraints { make in
            make.height.equalTo(250.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            
        }
    }
    func changeStatePicker() {
        self.statePicker = (self.statePicker + 1) % 2
        UIView.animate(withDuration: 0.2) {
            self.updatePickerConstraint()
            self.layoutIfNeeded()
        }
    }
    func updatePickerConstraint() {
        if self.statePicker == 0 {
            picker.snp.remakeConstraints { make in
                make.height.equalTo(0.VAdapted)
                make.left.equalTo(self.snp.left).offset(0.HAdapted)
                make.right.equalTo(self.snp.right).offset(0.HAdapted)
                make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
                
            }
        } else {
            picker.snp.remakeConstraints { make in
                make.height.equalTo(216.VAdapted)
                make.left.equalTo(self.snp.left).offset(0.HAdapted)
                make.right.equalTo(self.snp.right).offset(0.HAdapted)
                make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            }
        }
    }
    func pickerOff() {
        self.statePicker = 0
        UIView.animate(withDuration: 0.2) {
            self.closedPicker()
            self.layoutIfNeeded()
        }
    }
    func closedPicker() {
        picker.snp.remakeConstraints { make in
            make.height.equalTo(0.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(0.VAdapted)
            
        }
    }
    
    
}
