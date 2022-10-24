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
    var healthyTableView = UITableView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
   
    
    func decorate() {
       
        healthyTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        healthyTableView.clipsToBounds = true
        healthyTableView.backgroundColor = .clear
        healthyTableView.separatorColor = UIColor.clear
        healthyTableView.isHidden = false
        collectionView.backgroundColor = .clear
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        self.addSubview(healthyTableView)
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        healthyTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(24.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
