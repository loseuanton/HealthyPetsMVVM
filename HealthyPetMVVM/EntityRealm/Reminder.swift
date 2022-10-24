//
//  Reminder.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 9.10.22.
//

import Foundation
import UIKit
import RealmSwift

class Reminder: Object, Identifiable {
    @Persisted var id: String = UUID().uuidString
    @Persisted var reminderIcon: Data
    @Persisted var time: Date = Date()
    @Persisted var action: String = "Прививки"
    @Persisted var comment: String = ""
}

extension Reminder {
    func copyReminder() -> Reminder {
        var reminder = Reminder()
        reminder.id = self.id
        reminder.reminderIcon = self.reminderIcon
        reminder.time = self.time
        reminder.action = self.action
        reminder.comment = self.comment
        return reminder
    }
}
