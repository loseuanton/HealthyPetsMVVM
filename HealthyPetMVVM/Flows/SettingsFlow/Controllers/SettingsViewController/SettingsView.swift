//
//  SettingsView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 8.09.22.
//

import Foundation
import UIKit
import SnapKit


class SettingsView: UIView {
    var backgroundView = UIView()
    var settingsTableView = UITableView()
    var settingsWoman = UIImageView()
    
    func decorate() {
        settingsWoman.image = UIImage(named: "settingsWoman")
        settingsWoman.contentMode = .scaleAspectFit
        
        settingsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        settingsTableView.layer.cornerRadius = 10
        settingsTableView.clipsToBounds = true
        settingsTableView.isScrollEnabled = false
     
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(settingsTableView)
        backgroundView.addSubview(settingsWoman)
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(24.VAdapted)
            make.size.equalTo([358, 132].HResized)
            make.centerX.equalToSuperview()
        }
        settingsWoman.snp.makeConstraints { make in
            make.top.equalTo(settingsTableView.snp.bottom).offset(98.VAdapted)
            make.left.equalTo(self.snp.left).offset(32.HAdapted)
            make.right.equalTo(self.snp.right).offset(-32.HAdapted)
            make.bottom.equalTo(self.snp.bottom).offset(-111.VAdapted)
        }
        
    }
}

