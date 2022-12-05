//
//  HistoryReminderViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 26.10.22.
//

import Foundation


class HistoryReminderViewModel {
    var historyReminder: HistoryReminder = HistoryReminder()
    var historyReminderServices = HistoryReminderService()
    
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    
    func loadTableCells() {
        let historyReminderTableViewCellItem = self.generateHistoryReminderTableViewCellItem()
        
        
        self.complitionTableLoadData?(historyReminderTableViewCellItem)
    }
    func generateHistoryReminderTableViewCellItem() -> [HistoryReminderTableViewCellItem] {
        
        var items: [HistoryReminderTableViewCellItem] = []
        
        let reminder = historyReminderServices.getHistoryReminder()
        
        let newReminder = reminder
            .sorted { $0.time > $1.time }
        newReminder.forEach { newReminder in
            var item = HistoryReminderTableViewCellItem()
            item.historyReminder = newReminder
            items.append(item)
            
        }
        
        
        return items
    }
    
    
}
