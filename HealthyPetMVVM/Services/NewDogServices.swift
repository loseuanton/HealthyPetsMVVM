//
//  NewDogServices.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.09.22.
//

import Foundation
import RealmSwift

//protocol NewDogProtocol {
//    func saveNewDog(newDog: NewDog)
//}
//
//protocol DogsDataSourceProtocol {
//    func saveNewDog(newDog: NewDog)
//    func removeDog(dog: NewDog)
//}

class NewDogServices {
    var realm = try! Realm()
    
    init() {}
    
    func saveNewDog(newDog: NewDog) {
        try! realm.write({
            self.realm.add(newDog)
        })
    }
    func getNewDogs() -> Results<NewDog> {
        let newDogs = realm.objects(NewDog.self)
        return newDogs
    }
    func removeDog(dog: NewDog) {
        try! realm.write({
            self.realm.delete(dog)
        })
    }
    func saveEditDog(newDog: NewDog) {
        let predicate = NSPredicate(format: "id == %@", newDog.id)
        
        if let editDog = realm.objects(NewDog.self).filter(predicate).first {
            try! realm.write({
                editDog.name = newDog.name
                editDog.imageDog = newDog.imageDog
                editDog.gender = newDog.gender
                editDog.ageYears = newDog.ageYears
                editDog.ageMonth = newDog.ageMonth
                editDog.animalDogOrCat = newDog.animalDogOrCat
                editDog.breed = newDog.breed
                editDog.imagePassport = newDog.imagePassport
                editDog.imageMedicalBook = newDog.imageMedicalBook
            })
        }
    }
}
