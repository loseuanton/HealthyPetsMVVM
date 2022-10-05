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
    @Persisted var breed: String = "Дургая порода"
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
        newDog.breed = self.breed
        return newDog
    }
}
