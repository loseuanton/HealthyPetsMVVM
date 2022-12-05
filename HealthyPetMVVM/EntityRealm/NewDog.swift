//
//  NewDog.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.09.22.
//

import Foundation
import UIKit
import RealmSwift

class NewDog: Object, Identifiable {
    @Persisted var id: String = UUID().uuidString
    @Persisted var imageDog: Data
    @Persisted var name: String = "Акира"
    @Persisted var gender: String = "Мужской"
    @Persisted var ageYears = 0
    @Persisted var ageMonth = 0
    @Persisted var animalDogOrCat: String = "Собака"
    @Persisted var breed: String = "Метис"
    @Persisted var imagePassport: Data
    @Persisted var imageMedicalBook: Data
}

extension NewDog {
    func copyNewDog() -> NewDog {
        var newDog = NewDog()
        newDog.id = self.id
        newDog.imageDog = self.imageDog
        newDog.name = self.name
        newDog.gender = self.gender
        newDog.ageMonth = self.ageMonth
        newDog.ageYears = self.ageYears
        newDog.animalDogOrCat = self.animalDogOrCat
        newDog.breed = self.breed
        newDog.imagePassport = self.imagePassport
        newDog.imageMedicalBook = self.imageMedicalBook
        return newDog
    }
}
