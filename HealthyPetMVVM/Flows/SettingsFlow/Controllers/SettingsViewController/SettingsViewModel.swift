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
        let languageTableViewCellItem = self.generateLanguageTableViewCellItem()
        let rateUsAndPrivacyPolicyTableViewCellItem = self.generateRateUsAndPrivacyPolicyTableViewCellItem()
        self.complitionTableLoadData?([languageTableViewCellItem] + rateUsAndPrivacyPolicyTableViewCellItem)
        
    }
    
    func generateLanguageTableViewCellItem() -> LanguageTableViewCellItem {
        /*
        var language: [Language] = []
        language.append(Language(language: "Язык", selectedLanguage: "Русский"))
        
        var tableItemsArray: [LanguageTableViewCellItem] = []
        for language in language {
            tableItemsArray.append(LanguageTableViewCellItem(cellIdentifier: "LanguageTableViewCellItem", language: language))
        }
        return tableItemsArray
        */
        var item = LanguageTableViewCellItem()
        return item
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
