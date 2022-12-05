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
    var rightBarButton = UIButton()
    var imageReminder = UIImageView()
    var titleLabel = UILabel()
    var repeatTextLabel = UILabel()
    var chevronIcon = UIImageView()
   
    
    func decorate() {
        rightBarButton.setTitle("Готово", for: .normal)
        rightBarButton.tintColor = .black
        rightBarButton.setTitleColor(UIColor.black, for: .normal)
        rightBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
        
      
        
        commentLabel.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 17, text: "Комментарий", letter: -0.41)
        commentLabel.textAlignment = .left
        commentLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(20).adaptedFontSize)
       
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.setTitle(" Назад", for: .normal)
        leftBarButton.tintColor = .black
        leftBarButton.setTitleColor(UIColor.black, for: .normal)
        leftBarButton.setTitleColor( UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), for: .highlighted)
        
        
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
        
        //datePicker.locale = Locale(identifier: "en_GB")
        if let localeID = Locale.preferredLanguages.first {
            datePicker.locale = Locale(identifier: localeID)
        }
            
        datePicker.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        
        repeatButton.setImage(UIImage(named: "repeatButton"), for: .normal)
        repeatButton.contentHorizontalAlignment = .left
        repeatButton.setTitle("Повтор", for: .normal)
        repeatButton.setTitleColor(UIColor.black, for: .normal)
        repeatButton.backgroundColor = .white
        repeatButton.contentEdgeInsets.left = 16
        repeatButton.titleEdgeInsets.left = 8
        repeatButton.layer.cornerRadius = 13
        repeatButton.setBackgroundColor(color: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), forState: .highlighted)
        repeatTextLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "Никогда", letter: -0.08)
        repeatTextLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        repeatTextLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        chevronIcon.image = UIImage(systemName: "chevron.right")
        chevronIcon.tintColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(commentLabel)
        dateView.addSubview(dateLabel)
        dateView.addSubview(datePicker)
        repeatButton.addSubview(repeatTextLabel)
        repeatButton.addSubview(chevronIcon)
        
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
        chevronIcon.snp.makeConstraints { make in
            make.right.equalTo(repeatButton.snp.right).offset(-19.HAdapted)
            make.size.equalTo([13, 22].HResized)
            make.centerY.equalTo(repeatButton.snp.centerY)
        }
        repeatTextLabel.snp.makeConstraints { make in
            make.right.equalTo(chevronIcon.snp.left).offset(-10.HAdapted)
            make.height.equalTo(18)
            make.centerY.equalTo(repeatButton.snp.centerY)
        }
    }
}

