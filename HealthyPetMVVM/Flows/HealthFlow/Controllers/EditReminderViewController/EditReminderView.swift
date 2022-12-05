//
//  EditReminderView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 23.10.22.
//

import Foundation
import UIKit
import SnapKit



class EditReminderView: UIView {
    // MARK: - Views
    var backgroundView = UIView()
    var commentLabel = UILabel()
    var textView = UITextView()
    var dateView = UIView()
    var dateLabel = UILabel()
    var datePicker = UIDatePicker()
    var completeButton = UIButton()
    var deleteReminderButton = UIButton()
    var leftBarButton = UIButton()
    var rightBarButton = UIButton()
    var imageReminder = UIImageView()
   
   
    // MARK: - Decorate Views
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
        
        dateLabel.textAlignment = .left
        dateLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Дата", letter: -0.41)
        
        //datePicker.locale = Locale(identifier: "en_GB")
        if let localeID = Locale.preferredLanguages.first {
            datePicker.locale = Locale(identifier: localeID)
        }
        datePicker.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        
        
        
        completeButton.setTitle("Завершить", for: .normal)
        completeButton.setTitleColor(UIColor.white, for: .normal)
        completeButton.backgroundColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        
        completeButton.setBackgroundColor(color: UIColor(red: 0.635, green: 0.492, blue: 1, alpha: 1), forState: .highlighted)
        completeButton.layer.cornerRadius = 13
        
        deleteReminderButton.setTitle("Удалить напоминание", for: .normal)
        deleteReminderButton.setTitleColor(UIColor(red: 1, green: 0.231, blue: 0.188, alpha: 1), for: .normal)
        //deleteReminderButton.setTitleColor(.black, for: .highlighted)
        deleteReminderButton.setBackgroundColor(color: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18), forState: .highlighted)
        
        deleteReminderButton.backgroundColor = .white
        deleteReminderButton.layer.cornerRadius = 13
        
        
        
    }
    // MARK: - Add Subviews
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(commentLabel)
        dateView.addSubview(dateLabel)
        dateView.addSubview(datePicker)
        
        
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
        completeButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        deleteReminderButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
    }
}

