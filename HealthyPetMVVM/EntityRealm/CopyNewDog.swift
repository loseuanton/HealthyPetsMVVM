//
//  CopyNewDog.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 26.09.22.
//

import Foundation
import UIKit
import RealmSwift

class CopyNewDog: Object, Identifiable {
    @Persisted var id: String = UUID().uuidString
    @Persisted var imageDog: Data
    @Persisted var name: String = ""
    @Persisted var gender: String = ""
    @Persisted var ageYears = 0
    @Persisted var ageMonth = 0
    @Persisted var breed: String = ""
}
