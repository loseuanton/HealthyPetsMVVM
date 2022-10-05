//
//  RepeatView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 19.09.22.
//

import Foundation
import UIKit
import SnapKit


class RepeatView: UIView {
    var backgroundView = UIView()
    var repeatTableView = UITableView()
    var leftBarButton = UIButton()
   
    
    func decorate() {
        repeatTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        repeatTableView.layer.cornerRadius = 10
        repeatTableView.clipsToBounds = true
        repeatTableView.isScrollEnabled = false
        
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.tintColor = .black
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.setTitleColor(UIColor.blue, for: .selected)
     
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(repeatTableView)
       
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        repeatTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(24.VAdapted)
            make.size.equalTo([358, 220].HResized)
            make.centerX.equalToSuperview()
        }
        
    }
}
