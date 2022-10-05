//
//  HealthView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 15.08.22.
//

import Foundation
import UIKit
import SnapKit


class HealthView: UIView {
    var backgroundView = UIView()
    var labelSegment = UILabel()
    var segmentedControl = UISegmentedControl(items: ["Уход", "Медицина"])
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var tableView = UITableView()
    var dogWithGroceryBag = UIImageView()
    
    
    func decorate() {
        
        dogWithGroceryBag.image = UIImage(named: "dogWithGroceryBag")
        dogWithGroceryBag.contentMode = .scaleAspectFit
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)], for: .selected)
        
        collectionView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .clear
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        self.addSubview(segmentedControl)
        self.addSubview(tableView)
        self.addSubview(collectionView)
        backgroundView.addSubview(dogWithGroceryBag)
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(18.VAdapted)
            make.leading.equalTo(backgroundView.snp.leading).offset(16.HAdapted)
            make.trailing.equalTo(backgroundView.snp.trailing).offset(-16.HAdapted)
            make.height.equalTo(32)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom)
            
        }
        dogWithGroceryBag.snp.makeConstraints { make in
            make.left.equalTo(backgroundView.snp.left).offset(72.HAdapted)
            make.right.equalTo(backgroundView.snp.right).offset(-72.HAdapted)
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-99.VAdapted)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.trailing.equalToSuperview()
            
        }
    }
}

