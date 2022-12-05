//
//  EditProfileDogViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 27.08.22.
//

import Foundation
import UIKit

class EditProfileDogViewModel {
    var editDog: NewDog?
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    var editDogCopy: NewDog?
    var changeDogImage: ((UIImage?) -> Void)?
    var dogGenderItem = EditGenderTableViewCellItem()
    var dogAgeItem = EditAgeTableViewCellItem()
    var dogBreedItem = EditBreedsTableViewCellItem()
    
    
    func updateDogYearsAge(age: Int) {
        editDogCopy?.ageYears = age
        dogAgeItem.updateDogAgeYears(age: age)
    }
    func updateDogMonthAge(age: Int) {
        editDogCopy?.ageMonth = age
        dogAgeItem.updateDogAgeMonth(age: age)
    }
    
    func updateDogGender(gender: String) {
        editDogCopy?.gender = gender
        dogGenderItem.updateDogYearsAge(gender: gender)
    }
    func updateDogBreed(breed: String) {
        editDogCopy?.breed = breed
        dogBreedItem.updateDogBreed(breed: breed)
    }
    
    func loadTableCells() {
        let editNicknameTableViewCellItem = self.generateEditNicknameCollectionViewCellItem()
        let editGenderTableViewCellItem = self.generateEditGenderTableViewCellItem()
        let editAgeTableViewCellItem = self.generateEditAgeTableViewCellItem()
        let editBreedsTableViewCellItem = self.generateEditBreedsTableViewCellItem()
        self.complitionTableLoadData?([editNicknameTableViewCellItem, editGenderTableViewCellItem, editAgeTableViewCellItem, editBreedsTableViewCellItem])
        
    }
    
    func generateEditNicknameCollectionViewCellItem() -> EditNicknameTableViewCellItem {
        var item = EditNicknameTableViewCellItem()
        item.dog = editDogCopy
        item.changeEditDogName = { [weak self] editDogName in
            self?.editDogCopy?.name = editDogName
        }
        return item
        
    }
    func generateEditGenderTableViewCellItem() -> EditGenderTableViewCellItem {
        var item = EditGenderTableViewCellItem()
        item.dog = editDogCopy
        dogGenderItem = item
        return dogGenderItem
        
    }
    func generateEditAgeTableViewCellItem() -> EditAgeTableViewCellItem {
        var item = EditAgeTableViewCellItem()
        item.dog = editDogCopy
        dogAgeItem = item
        return dogAgeItem
        
    }
    func generateEditBreedsTableViewCellItem() -> EditBreedsTableViewCellItem {
        var item = EditBreedsTableViewCellItem()
        item.dog = editDogCopy
        dogBreedItem = item
        
        return dogBreedItem
        
    }
    
}

