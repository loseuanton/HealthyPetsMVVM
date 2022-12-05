//
//  SettingsViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 8.09.22.
//

import Foundation
import UIKit

class SettingsViewModel {
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    
    
    func loadTableCells() {
        let rateUsAndPrivacyPolicyTableViewCellItem = self.generateRateUsAndPrivacyPolicyTableViewCellItem()
        self.complitionTableLoadData?(rateUsAndPrivacyPolicyTableViewCellItem)
        
    }
    
    func generateRateUsAndPrivacyPolicyTableViewCellItem() -> [RateUsAndPrivacyPolicyTableViewCellItem] {
        var rateUsAndPrivacyPolicy: [RateUsAndPrivacyPolicy] = []
        rateUsAndPrivacyPolicy.append(RateUsAndPrivacyPolicy(rateUsAndPrivacyPolicy: "Оцените нас"))
        rateUsAndPrivacyPolicy.append(RateUsAndPrivacyPolicy(rateUsAndPrivacyPolicy: "Политика конфиденциальности"))
        
        var tableItemsArray: [RateUsAndPrivacyPolicyTableViewCellItem] = []
        for rateUsAndPrivacyPolicy in rateUsAndPrivacyPolicy {
            tableItemsArray.append(RateUsAndPrivacyPolicyTableViewCellItem(cellIdentifier: "RateUsAndPrivacyPolicyTableViewCellItem", rateUsAndPrivacyPolicy: rateUsAndPrivacyPolicy))
        }
        return tableItemsArray
        
    }
}
