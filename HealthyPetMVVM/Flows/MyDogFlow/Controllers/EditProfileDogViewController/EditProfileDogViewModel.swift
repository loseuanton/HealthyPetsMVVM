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
    
    func updateDogYearsAge(gender: String) {
        editDogCopy?.gender = gender
        dogGenderItem.updateDogYearsAge(gender: gender)
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
            print(self?.editDogCopy)
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
        return item
        
    }
    func generateEditBreedsTableViewCellItem() -> EditBreedsTableViewCellItem {
        var item = EditBreedsTableViewCellItem()
        item.dog = editDogCopy
        return item
        
    }
    
}

