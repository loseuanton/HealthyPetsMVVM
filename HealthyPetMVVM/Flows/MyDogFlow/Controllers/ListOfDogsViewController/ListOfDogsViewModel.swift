//
//  ListOfDogsViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 14.08.22.
//

import Foundation
import UIKit

enum PetType {
    case dog
    case cat
}

class ListOfDogsViewModel {

    
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
   
    
    func loadTableCells(for type: PetType) {
        let listOfCellItems: [ListOfDogsTableViewCellItem]
        switch type {
        case .dog:
            listOfCellItems = self.generateListOfDogsTableViewCellItem()
        case .cat:
            listOfCellItems = self.generateListOfCatsTableViewCellItem()
        }
        self.complitionTableLoadData?(listOfCellItems)
        
    }
    var dogsArray: [ListOfDogs] = []
    
    private func generateListOfDogsTableViewCellItem() -> [ListOfDogsTableViewCellItem] {
        if dogsArray.count == 0 {
            var dogsArray: [ListOfDogs] = []
            dogsArray.append(ListOfDogs(name: "Другая порода"))
            dogsArray.append(ListOfDogs(name: "Австралийская короткохвостая пастушья собака"))
            dogsArray.append(ListOfDogs(name: "Австралийская овчарка"))
            dogsArray.append(ListOfDogs(name: "Австралийская пастушья собака"))
            dogsArray.append(ListOfDogs(name: "Австралийский келпи"))
            dogsArray.append(ListOfDogs(name: "Австралийский терьер"))
            dogsArray.append(ListOfDogs(name: "Австралийский шелковистый терьер"))
            dogsArray.append(ListOfDogs(name: "Австрийская гончая"))
            self.dogsArray = dogsArray
        }
        var tableItemsArray: [ListOfDogsTableViewCellItem] = []
        for listOfDog in dogsArray {
            tableItemsArray.append(ListOfDogsTableViewCellItem(cellIdentifier: "ListOfDogsTableViewCellItem", listOfDog: listOfDog))
        }
        return tableItemsArray
        
    }
    
    private func generateListOfCatsTableViewCellItem() -> [ListOfDogsTableViewCellItem] {
        if dogsArray.count == 0 {
            var dogsArray: [ListOfDogs] = []
            dogsArray.append(ListOfDogs(name: "Другая порода"))
            dogsArray.append(ListOfDogs(name: "Cat1"))
            dogsArray.append(ListOfDogs(name: "Cat2"))
            dogsArray.append(ListOfDogs(name: "Cat3"))
            dogsArray.append(ListOfDogs(name: "Cat4"))
            self.dogsArray = dogsArray
        }
        var tableItemsArray: [ListOfDogsTableViewCellItem] = []
        for listOfDog in dogsArray {
            tableItemsArray.append(ListOfDogsTableViewCellItem(cellIdentifier: "ListOfDogsTableViewCellItem", listOfDog: listOfDog))
        }
        return tableItemsArray
        
    }
    
    func filterArray(text: String) {
        let filterArray = dogsArray.filter { listOfDogs in
            return listOfDogs.name.uppercased().contains(text.uppercased())
        }
        var tableItemsArray: [ListOfDogsTableViewCellItem] = []
        for listOfDog in filterArray {
            tableItemsArray.append(ListOfDogsTableViewCellItem(cellIdentifier: "ListOfDogsTableViewCellItem", listOfDog: listOfDog))
        }
        self.complitionTableLoadData?(tableItemsArray)
    }
}
