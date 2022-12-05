//
//  HistoryReminderTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 26.10.22.
//

import Foundation
import UIKit
import SnapKit

struct HistoryReminderTableViewCellItem: BaseConfigureTableCellRowProtocol {
    var cellIdentifier = "HistoryReminderTableViewCellItem"
    var historyReminder: HistoryReminder?
}

class HistoryReminderTableViewCell: BaseTableViewCell {
    var item: HistoryReminderTableViewCellItem?
    var cellBackgroundView = UIView()
    var healthIImage = UIImageView()
    var timeLabel = UILabel()
    var actionLabel = UILabel()
    var settingsIcon = UIImageView()
    var missedLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    private func configureCell() {
        addSubviews()
        configureLayout()
    }
    override func configure(item: BaseConfigureTableCellRowProtocol) {
        self.backgroundColor = .clear
        
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.layer.cornerRadius = 10
        healthIImage.image = UIImage(named: "careImage-1")
        
        timeLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 13, text: "09:41 • 27 июля 2022 г.", letter: -0.08)
        timeLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        timeLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        
        actionLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 17, text: "Прививки", letter: -0.41)
        settingsIcon.image = UIImage(systemName: "gearshape")
        settingsIcon.tintColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        missedLabel.customBlackText(nameFont: "SFProText-Regular", sizeFont: 15, text: "Пропущено", letter: -0.24)
        missedLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        missedLabel.textColor = .red
        
        
        if let item = item as? HistoryReminderTableViewCellItem {
            self.item = item
            let dateForrmater = DateFormatter()
            dateForrmater.dateFormat = "HH:mm • dd MMMM yyyy г."
            let timeString = dateForrmater.string(from: item.historyReminder?.time ?? Date())
            
            self.timeLabel.text = timeString
            self.actionLabel.text = item.historyReminder?.action
            if let reminderIcon = item.historyReminder?.reminderIcon {
                self.healthIImage.image =  UIImage(data: reminderIcon as Data)
            }
        }
    }
    func addSubviews() {
       
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(healthIImage)
        cellBackgroundView.addSubview(timeLabel)
        cellBackgroundView.addSubview(actionLabel)
        cellBackgroundView.addSubview(settingsIcon)
    }
    func configureLayout() {
        cellBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(16.HAdapted)
            make.top.equalTo(contentView.snp.top).offset(8.VAdapted)
            make.right.equalTo(contentView.snp.right).offset(-16.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8.VAdapted)
        }
        healthIImage.snp.makeConstraints { make in
            make.left.equalTo(cellBackgroundView.snp.left).offset(16.HAdapted)
            make.centerY.equalTo(cellBackgroundView.snp.centerY)
            make.size.equalTo([30, 30].HResized)
        }
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(healthIImage.snp.right).offset(8.HAdapted)
            make.top.equalTo(cellBackgroundView.snp.top).offset(8.VAdapted)
            make.right.equalTo(cellBackgroundView.snp.right).offset(-9.HAdapted)
            make.bottom.equalTo(actionLabel.snp.top).offset(-4.VAdapted)
        }
        actionLabel.snp.makeConstraints { make in
            make.left.equalTo(healthIImage.snp.right).offset(8.HAdapted)
            make.top.equalTo(timeLabel.snp.bottom).offset(4.VAdapted)
            make.right.equalTo(cellBackgroundView.snp.right).offset(-9.HAdapted)
        }
        settingsIcon.snp.makeConstraints { make in
            make.centerY.equalTo(cellBackgroundView.snp.centerY)
            make.right.equalTo(cellBackgroundView.snp.right).offset(-19.HAdapted)
            make.size.equalTo([22, 22].HResized)
        }
       

        
    }
    
    
}

