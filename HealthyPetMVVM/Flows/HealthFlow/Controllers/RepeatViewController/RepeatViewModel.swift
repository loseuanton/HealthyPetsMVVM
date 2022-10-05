//
//  RepeatViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 19.09.22.
//

import Foundation
import UIKit

class RepeatViewModel {
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    
    
    func loadTableCells() {
        let repeatTableViewCellItem = self.generateRepeatTableViewCellItem()
        
        self.complitionTableLoadData?(repeatTableViewCellItem)
        
    }
    
    func generateRepeatTableViewCellItem() -> [RepeatTableViewCellItem] {
        var repeats: [Repeat] = []
        repeats.append(Repeat(repeats: "Никогда"))
        repeats.append(Repeat(repeats: "Ежедневно"))
        repeats.append(Repeat(repeats: "Еженедельно"))
        repeats.append(Repeat(repeats: "Ежемесячно"))
        repeats.append(Repeat(repeats: "Ежегодно"))
        
        
        var tableItemsArray: [RepeatTableViewCellItem] = []
        for repeats in repeats {
            tableItemsArray.append(RepeatTableViewCellItem(cellIdentifier: "RepeatTableViewCellItem", repeats: repeats))
        
        }
        return tableItemsArray
        
    }
    
}

