//
//  AddNewDogViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit



class AddNewDogViewModel {
    var complitionLoadData: (([BaseConfigureCollectionCellRowProtocol]) -> Void)?
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    var openListOfDogs: (() -> Void)?
    var changeDogImage: (( ((UIImage?) -> Void)? )  -> Void)?
    var dog: Dogs?
    var newDog: NewDog = NewDog()
    let dogAgeItem = DogAgeCollectionViewCellItem()
    
    func updateDogYearsAge(age: Int) {
        newDog.ageYears = age
        dogAgeItem.updateDogAgeYears(age: age)
    }
    func updateDogMonthAge(age: Int) {
        newDog.ageMonth = age
        dogAgeItem.updateDogAgeMonth(age: age)
    }
    
    
    func loadCollectionCells() {
        let nicknameDogCollectionViewCellItem = self.generateNicknameDogCollectionViewCellItem()
        let genderDogCollectionViewCellItem = self.generateGenderDogCollectionViewCellItem()
        let dogAgeCollectionViewCellItem = self.generateDogAgeCollectionViewCellItem()
        let breedsDogCollectionViewCellItem = self.generateBreedsDogCollectionViewCellItem()
        
        self.complitionLoadData?([nicknameDogCollectionViewCellItem, genderDogCollectionViewCellItem, dogAgeCollectionViewCellItem, breedsDogCollectionViewCellItem])
    }
    func generateNicknameDogCollectionViewCellItem() -> NicknameDogCollectionViewCellItem {
        var item = NicknameDogCollectionViewCellItem()
        item.changeDogName = { [weak self] dogName in
            self?.newDog.name = dogName
            print(self?.newDog.name)
            
        }
        item.changeDogImage = changeDogImage
        item.saveDogImage = { [weak self] image in
            let data = NSData(data: (image?.jpegData(compressionQuality: 0.9))!)
            self?.newDog.imageDog = data as Data
            print(self?.newDog.imageDog)
        }
        
        
        
        return item
    }
    func generateGenderDogCollectionViewCellItem() -> GenderDogCollectionViewCellItem {
        var item = GenderDogCollectionViewCellItem()
        item.changeDogGender = { [weak self] genderDog in
            self?.newDog.gender = genderDog
            
            print(self?.newDog.gender)
            
        }
        
        return item
        
    }
    func generateDogAgeCollectionViewCellItem() -> DogAgeCollectionViewCellItem {
        // dog age
        return dogAgeItem
        
    }
    func generateBreedsDogCollectionViewCellItem() -> BreedsDogCollectionViewCellItem {
        var item = BreedsDogCollectionViewCellItem()
        
        item.openListDogs = { [weak self] in
            self?.openListOfDogs?()
        }
        item.changeDogBreed = { [weak self] breedDog in
            self?.newDog.breed = breedDog
            print("\(String(describing: self?.newDog))")
        }
        
        return item
        
    }
    func loadTableCells() {
        let breedsDogTableViewCellItem = self.generateBreedsDogTableViewCellItem()
        self.complitionTableLoadData?(breedsDogTableViewCellItem)
        
    }
    func generateBreedsDogTableViewCellItem() -> [BreedsDogTableViewCellItem] {
        var dogsArray: [Dogs] = []
        dogsArray.append(Dogs(name: "Померанский шпиц"))
        dogsArray.append(Dogs(name: "Йоркширский терьер"))
        dogsArray.append(Dogs(name: "Чихуахуа"))
        dogsArray.append(Dogs(name: "Немецкая овчарка"))
        var tableItemsArray: [BreedsDogTableViewCellItem] = []
        for dog in dogsArray {
            tableItemsArray.append(BreedsDogTableViewCellItem(cellIdentifier: "BreedsDogTableViewCellItem", dog: dog))
        }
        return tableItemsArray
        
    }
    
}

