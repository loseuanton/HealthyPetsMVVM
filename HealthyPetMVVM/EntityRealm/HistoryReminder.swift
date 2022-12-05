//
//  HistoryReminder.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 26.10.22.
//

import Foundation
import UIKit
import RealmSwift

class HistoryReminder: Object, Identifiable {
    @Persisted var id: String = UUID().uuidString
    @Persisted var reminderIcon: Data
    @Persisted var time: Date = Date()
    @Persisted var action: String = "Прививки"
    @Persisted var comment: String = ""
}

