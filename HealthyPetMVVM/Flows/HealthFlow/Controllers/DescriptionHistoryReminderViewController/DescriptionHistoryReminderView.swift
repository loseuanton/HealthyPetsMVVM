//
//  DescriptionHistoryReminderView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.11.22.
//

import Foundation
import UIKit
import SnapKit



class DescriptionHistoryReminderView: UIView {
    // MARK: - Views
    var backgroundView = UIView()
    var commentLabel = UILabel()
    var textView = UITextView()
    var dateView = UIView()
    var dateLabel = UILabel()
    var deleteReminderButton = UIButton()
    var leftBarButton = UIButton()
    var imageReminder = UIImageView()
    var healthIImage = UIImageView()
   
   
    // MARK: - Decorate Views
    func decorate() {
        healthIImage.image = UIImage(named: "careImage-1")
        
        commentLabel.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 17, text: "Комментарий", letter: -0.41)
        commentLabel.textAlignment = .left
        commentLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(20).adaptedFontSize)
       
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
        leftBarButton.tintColor = .black
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        
        
        textView.layer.cornerRadius = 13
        textView.backgroundColor = .white
        textView.font = UIFont(name: "SFProText-Regular", size: 15)
        
        textView.attributedText = NSMutableAttributedString(string: "Добавьте описание, например, таблетка от клещей", attributes: [NSMutableAttributedString.Key.kern: -0.24])
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        textView.textColor = UIColor.black
        
        dateView.backgroundColor = .white
        dateView.layer.cornerRadius = 13
        
        dateLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "09:41 • 27 июля 2022 г.", letter: -0.08)
        dateLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        
        deleteReminderButton.setTitle("Удалить из истории", for: .normal)
        deleteReminderButton.setTitleColor(UIColor(red: 1, green: 0.231, blue: 0.188, alpha: 1), for: .normal)
        deleteReminderButton.setBackgroundColor(color: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), forState: .highlighted)
        
        deleteReminderButton.backgroundColor = .white
        deleteReminderButton.layer.cornerRadius = 13
        
        
        
    }
    // MARK: - Add Subviews
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(commentLabel)
        dateView.addSubview(healthIImage)
        dateView.addSubview(dateLabel)
        
        
        
    }
    // MARK: - Layout
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(24)
            make.leading.equalTo(backgroundView.snp.leading).offset(16)
            make.trailing.equalTo(backgroundView.snp.trailing).offset(-16)
            make.height.equalTo(22)
        }
        textView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        dateView.snp.makeConstraints { make in
            make.height.equalTo(46)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dateView.snp.centerY)
            make.left.equalTo(healthIImage.snp.right).offset(8.HAdapted)
            make.height.equalTo(22)
        }
        deleteReminderButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        healthIImage.snp.makeConstraints { make in
            make.left.equalTo(dateView.snp.left).offset(16.HAdapted)
            make.centerY.equalTo(dateView.snp.centerY)
            make.size.equalTo([30, 30].HResized)
        }
        
    }
}


