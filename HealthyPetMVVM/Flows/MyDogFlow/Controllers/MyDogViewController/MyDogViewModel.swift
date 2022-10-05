//
//  MyDogViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 9.08.22.
//

import Foundation
import UIKit

class MyDogViewModel {
    var newDogServices = NewDogServices()
    
    var complitionLoadData: (([BaseConfigureCollectionCellRowProtocol]) -> Void)?
    
    func loadCells() {
        let myDogsCollectionViewCellItem = self.generateMyDogsCollectionViewCellItem()
        
        
        self.complitionLoadData?(myDogsCollectionViewCellItem)
    }
    func generateMyDogsCollectionViewCellItem() -> [MyDogsCollectionViewCellItem] {
        
        var items: [MyDogsCollectionViewCellItem] = []
        
        let dogs = newDogServices.getNewDogs()
        
        dogs.forEach { newDog in
            var item = MyDogsCollectionViewCellItem()
            item.newDog = newDog
            items.append(item)
            
        }
        
        return items
    }
    
    
}
