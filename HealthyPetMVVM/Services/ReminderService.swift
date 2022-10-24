//
//  ReminderService.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 9.10.22.
//

import Foundation
import RealmSwift

class ReminderService {
    var realm = try! Realm()
    
    init() {}
    
    func saveReminder(reminder: Reminder) {
        try! realm.write({
            self.realm.add(reminder)
        })
    }
    func getReminder() -> Results<Reminder> {
        let reminder = realm.objects(Reminder.self)
        return reminder
    }
    func removeReminder(reminder: Reminder) {
        try! realm.write({
            self.realm.delete(reminder)
        })
    }
    func saveEditReminder(reminder: Reminder) {
        let predicate = NSPredicate(format: "id == %@", reminder.id)
        
        if let editReminder = realm.objects(Reminder.self).filter(predicate).first {
            try! realm.write({
                editReminder.comment = reminder.comment
                editReminder.time = reminder.time
                editReminder.action = reminder.action
                editReminder.reminderIcon = reminder.reminderIcon
            })
        }
    }
    
}

