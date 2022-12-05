//
//  HistoryReminderService.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 26.10.22.
//

import Foundation
import RealmSwift

class HistoryReminderService {
    var realm = try! Realm()
    
    init() {}
    
    func saveHistoryReminder(historyReminder: HistoryReminder) {
        try! realm.write({
            self.realm.add(historyReminder)
        })
    }
    func getHistoryReminder() -> Results<HistoryReminder> {
        let reminder = realm.objects(HistoryReminder.self)
        return reminder
    }
    func removeHistoryReminder(historyReminder: HistoryReminder) {
        try! realm.write({
            self.realm.delete(historyReminder)
        })
    }
    func saveEditReminder(historyReminder: HistoryReminder) {
        let predicate = NSPredicate(format: "id == %@", historyReminder.id)
        
        if let historyReminder = realm.objects(HistoryReminder.self).filter(predicate).first {
            try! realm.write({
                historyReminder.comment = historyReminder.comment
                historyReminder.time = historyReminder.time
                historyReminder.action = historyReminder.action
                historyReminder.reminderIcon = historyReminder.reminderIcon
            })
        }
    }
    
}


