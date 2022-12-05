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
    var openListOfBreeds: ((PetType) -> Void)?
    var changeBreedText: ((String) -> Void)?
    var changeDogImage: (( ((UIImage?) -> Void)? )  -> Void)?
    var dog: Dogs?
    var newDog: NewDog = NewDog()
    let dogAgeItem = DogAgeCollectionViewCellItem()
    var dogBreedItem = BreedsDogCollectionViewCellItem()
    
    func updateDogYearsAge(age: Int) {
        newDog.ageYears = age
        dogAgeItem.updateDogAgeYears(age: age)
    }
    func updateDogMonthAge(age: Int) {
        newDog.ageMonth = age
        dogAgeItem.updateDogAgeMonth(age: age)
    }
    func updateDogBreed(breed: String) {
        newDog.breed = breed
        dogBreedItem.updateDogBreed(breed: breed)
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
            
        }
        item.changeDogImage = changeDogImage
        item.saveDogImage = { [weak self] image in
            let data = NSData(data: (image?.jpegData(compressionQuality: 0.9))!)
            self?.newDog.imageDog = data as Data
        }
        return item
    }
    func generateGenderDogCollectionViewCellItem() -> GenderDogCollectionViewCellItem {
        var item = GenderDogCollectionViewCellItem()
        item.changeDogGender = { [weak self] genderDog in
            self?.newDog.gender = genderDog
        }
        return item
    }
    
    func generateDogAgeCollectionViewCellItem() -> DogAgeCollectionViewCellItem {
        return dogAgeItem
    }
    
    func generateBreedsDogCollectionViewCellItem() -> BreedsDogCollectionViewCellItem {
        let item = BreedsDogCollectionViewCellItem()
        item.changeDogOrCat = { [weak self] dogOrCat in
            self?.newDog.animalDogOrCat = dogOrCat
        }
        item.openListOfBreeds = { [weak self] petType in
            self?.openListOfBreeds?(petType)
        }
        dogBreedItem = item
        return item
        
    }
}

