//
//  ListOfDogsViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 14.08.22.
//

import Foundation
import UIKit

class ListOfDogsViewModel {
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    
    
    func loadTableCells() {
        let listOfDogsTableViewCellItem = self.generateListOfDogsTableViewCellItem()
        self.complitionTableLoadData?(listOfDogsTableViewCellItem)
        
    }
    
    func generateListOfDogsTableViewCellItem() -> [ListOfDogsTableViewCellItem] {
        var dogsArray: [ListOfDogs] = []
        dogsArray.append(ListOfDogs(name: "Другая порода"))
        dogsArray.append(ListOfDogs(name: "Австралийская короткохвостая пастушья собака"))
        dogsArray.append(ListOfDogs(name: "Австралийская овчарка"))
        dogsArray.append(ListOfDogs(name: "Австралийская пастушья собака"))
        dogsArray.append(ListOfDogs(name: "Австралийский келпи"))
        dogsArray.append(ListOfDogs(name: "Австралийский терьер"))
        dogsArray.append(ListOfDogs(name: "Австралийский шелковистый терьер"))
        dogsArray.append(ListOfDogs(name: "Австрийская гончая"))
        var tableItemsArray: [ListOfDogsTableViewCellItem] = []
        for listOfDog in dogsArray {
            tableItemsArray.append(ListOfDogsTableViewCellItem(cellIdentifier: "ListOfDogsTableViewCellItem", listOfDog: listOfDog))
        }
        return tableItemsArray
        
    }
}
