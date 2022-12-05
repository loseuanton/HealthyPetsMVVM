//
//  HistoryReminderView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 26.10.22.
//

import Foundation
import UIKit
import SnapKit


class HistoryReminderView: UIView {
    var backgroundView = UIView()
    var historyReminderTableView = UITableView()
    var leftBarButton = UIButton()
    var noRemindersIcon = UIImageView()
    var noReminderLabel = UILabel()
    
   
    
    func decorate() {
        noRemindersIcon.image = UIImage(named: "noRemindersIcon")
        noReminderLabel.customBlackText(nameFont: "SFPro-Medium", sizeFont: 16, text: "Нет напоминаний", letter: -0.32)
        noReminderLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
       
       
        historyReminderTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        historyReminderTableView.clipsToBounds = true
        historyReminderTableView.backgroundColor = .clear
        historyReminderTableView.separatorColor = UIColor.clear
        historyReminderTableView.isHidden = false
        
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.tintColor = .black
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.setTitleColor(UIColor.blue, for: .selected)
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        self.addSubview(historyReminderTableView)
        
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        
        historyReminderTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(24.VAdapted)
            make.left.equalTo(self.snp.left).offset(0.HAdapted)
            make.right.equalTo(self.snp.right).offset(0.HAdapted)
            make.bottom.equalTo(self.snp.bottom)
        }
        
    }
    func addNoReminderIconAndLabel() {
        self.addSubview(noRemindersIcon)
        self.addSubview(noReminderLabel)
        noRemindersIcon.snp.makeConstraints { make in
            make.size.equalTo([80, 80].HResized)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        noReminderLabel.snp.makeConstraints { make in
            make.top.equalTo(noRemindersIcon.snp.bottom).offset(12.VAdapted)
            make.centerX.equalTo(noRemindersIcon.snp.centerX)
            make.height.equalTo(21.VAdapted)
        }
    }
    func removeIconAndLabel() {
        noReminderLabel.removeFromSuperview()
        noRemindersIcon.removeFromSuperview()
    }
}
