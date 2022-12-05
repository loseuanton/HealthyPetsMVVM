//
//  AllTypesView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 22.11.22.
//

import Foundation
import UIKit
import SnapKit


class AllTypesView: UIView {
    var backgroundView = UIView()
    var tableView = UITableView() // private
    var rightBarButton = UIButton()
    
    func decorate() {
        self.backgroundColor = .white
        rightBarButton.setTitle("Карта", for: .normal)
        rightBarButton.tintColor = .black
        rightBarButton.setTitleColor(UIColor.black, for: .normal)
        rightBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = UIColor.clear
        tableView.isHidden = false
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(tableView)
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
           
            make.top.bottom.right.left.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(12.VAdapted)
            make.bottom.right.left.equalToSuperview()
        }
    }
}
