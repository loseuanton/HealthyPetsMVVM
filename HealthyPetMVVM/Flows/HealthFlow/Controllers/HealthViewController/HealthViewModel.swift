//
//  HealthViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 15.08.22.
//

import Foundation
import UIKit

class HealthViewModel {
    var newTitle: ((String, UIImage?) -> Void)?
    var reminder: Reminder = Reminder()
    var reminderService = ReminderService()
    var natificationCenter = NotificationCenter()
   
    
    var complitionLoadData: (([BaseConfigureCollectionCellRowProtocol], [BaseConfigureCollectionCellRowProtocol]) -> Void)?
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    func loadCells() {
        let healthCollectionViewCellItem = self.generateHealthCollectionViewCellItem()
        let healthCollectionViewCellItem2 = self.generateHealthCollectionViewCellItem2()
        
        
        self.complitionLoadData?(healthCollectionViewCellItem, healthCollectionViewCellItem2)
    }
    func generateHealthCollectionViewCellItem() -> [HealthCollectionViewCellItem] {
        var careArray: [CareArray] = []
        careArray.append(CareArray(name: "Выгул", image: UIImage(named: "careImage-1")!))
        careArray.append(CareArray(name: "Питание", image: UIImage(named: "careImage-2")!))
        careArray.append(CareArray(name: "Гигиена", image: UIImage(named: "careImage-3")!))
        careArray.append(CareArray(name: "Груминг", image: UIImage(named: "careImage-4")!))
        careArray.append(CareArray(name: "Лакомство", image: UIImage(named: "careImage-5")!))
        careArray.append(CareArray(name: "Стрижка когтей", image: UIImage(named: "careImage-6")!))
        careArray.append(CareArray(name: "Чистка ушей", image: UIImage(named: "careImage-7")!))
        careArray.append(CareArray(name: "Чистка зубов", image: UIImage(named: "careImage-8")!))
        careArray.append(CareArray(name: "Игры", image: UIImage(named: "careImage-9")!))
        
        var collectionItemArray: [HealthCollectionViewCellItem] = []
        for careArray in careArray {
            collectionItemArray.append(HealthCollectionViewCellItem(cellIdentifier: "HealthCollectionViewCellItem", careArray: careArray))
        }
        
        return collectionItemArray
    }
    func generateHealthCollectionViewCellItem2() -> [HealthCollectionViewCellItem] {
        var medicineArray: [CareArray] = []
        medicineArray.append(CareArray(name: "Вакцинация", image: UIImage(named: "medicineImage-1")!))
        medicineArray.append(CareArray(name: "Анализы", image: UIImage(named: "medicineImage-2")!))
        medicineArray.append(CareArray(name: "Аллергия", image: UIImage(named: "medicineImage-3")!))
        medicineArray.append(CareArray(name: "От клещей", image: UIImage(named: "medicineImage-4")!))
        medicineArray.append(CareArray(name: "От глистов", image: UIImage(named: "medicineImage-5")!))
        medicineArray.append(CareArray(name: "Операции", image: UIImage(named: "medicineImage-6")!))
        
        var collectionItemArray: [HealthCollectionViewCellItem] = []
        for medicineArray in medicineArray {
            collectionItemArray.append(HealthCollectionViewCellItem(cellIdentifier: "HealthCollectionViewCellItem", careArray: medicineArray))
        }
        
        
        return collectionItemArray
    }
    func loadTableCells() {
        let healthTableViewCellItem = self.generateHealthTableViewCellItem()
        let healthReminderTableViewCellItem = self.generateHealthReminderTableViewCellItem()
        self.complitionTableLoadData?([healthTableViewCellItem] + healthReminderTableViewCellItem)
        
    }
    func generateHealthTableViewCellItem() -> HealthTableViewCellItem {
       var item = HealthTableViewCellItem()
        item.newTitle = { [weak self] title, image in
            self?.newTitle?(title, image)
        }
        
        print(self.reminder.reminderIcon)
        return item
        
    }
    func generateHealthReminderTableViewCellItem() -> [HealthReminderTableViewCellItem] {
        var items: [HealthReminderTableViewCellItem] = []
        
        let reminder = reminderService.getReminder()
        reminder.forEach { reminder in
            var item = HealthReminderTableViewCellItem()
            item.reminder = reminder
            let dateForrmater = DateFormatter()
            dateForrmater.dateFormat = "dd MMMM, HH:mm"
            let timeString = dateForrmater.string(from: item.reminder?.time ?? Date())
            item.natificationCenter.sendNotifications(title: "\(item.reminder?.action ?? "Уведомление")",body: timeString, date: item.reminder?.time ?? Date())
            items.append(item)
        }
        
        
        return items
    }
    
    

    
    
    
}
