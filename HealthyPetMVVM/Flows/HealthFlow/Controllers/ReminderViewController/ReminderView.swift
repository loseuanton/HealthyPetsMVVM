//
//  ReminderView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 18.08.22.
//

import Foundation
import UIKit
import SnapKit



class ReminderView: UIView {
    
    var backgroundView = UIView()
    var commentLabel = UILabel()
    var textView = UITextView()
    var dateView = UIView()
    var dateLabel = UILabel()
    var datePicker = UIDatePicker()
    var repeatButton = UIButton()
    var leftBarButton = UIButton()
   
    
    func decorate() {
        
        
        commentLabel.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 17, text: "Комментарий", letter: -0.41)
        commentLabel.textAlignment = .left
        commentLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(20).adaptedFontSize)
       
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.tintColor = .black
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.setTitleColor(UIColor.blue, for: .selected)
        
        
        textView.layer.cornerRadius = 13
        textView.backgroundColor = .white
        textView.font = UIFont(name: "SFProText-Regular", size: 15)
        
        textView.attributedText = NSMutableAttributedString(string: "Добавьте описание, например, таблетка от клещей", attributes: [NSMutableAttributedString.Key.kern: -0.24])
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        textView.textColor = UIColor.lightGray
        
        dateView.backgroundColor = .white
        dateView.layer.cornerRadius = 13
        
        dateLabel.textAlignment = .left
        dateLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Дата", letter: -0.41)
        
        
        repeatButton.setImage(UIImage(named: "repeatButton"), for: .normal)
        repeatButton.contentHorizontalAlignment = .left
        repeatButton.setTitle("Повтор", for: .normal)
        repeatButton.setTitleColor(UIColor.black, for: .normal)
        repeatButton.backgroundColor = .white
        repeatButton.contentEdgeInsets.left = 16
        repeatButton.titleEdgeInsets.left = 8
        repeatButton.layer.cornerRadius = 13
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(commentLabel)
        dateView.addSubview(dateLabel)
        dateView.addSubview(datePicker)
        
    }
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
            make.height.equalTo(60)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dateView.snp.centerY)
            make.leading.equalTo(dateView.snp.leading).offset(16)
            
        }
        datePicker.snp.makeConstraints { make in
            make.centerY.equalTo(dateView.snp.centerY)
            make.left.equalTo(dateLabel.snp.right).offset(10)
            make.trailing.equalTo(dateView.snp.trailing).offset(-16)
        }
        repeatButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}

