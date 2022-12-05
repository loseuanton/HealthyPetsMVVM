//
//  AllTypesViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 22.11.22.
//

import Foundation
class AllTypesViewModel {
    var typesOfServices: TypesOfServices?
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    
    func loadTableCells() {
        let allTypesTableViewCellItem = self.generateAllTypesTableViewCellItem()
        
        
        self.complitionTableLoadData?(allTypesTableViewCellItem)
    }
    func generateAllTypesTableViewCellItem() -> [AllTypesTableViewCellItem] {
        
        var items: [AllTypesTableViewCellItem] = []
        
        
        let type = typesOfServices?.allTypes
        type?.forEach { typeService in
            var item = AllTypesTableViewCellItem()
            item.typeServices = typeService
            items.append(item)
            
        }
        
        return items
    }
    
    
}
