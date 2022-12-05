//
//  TypesOfServices.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 18.11.22.
//

import UIKit

class TypesOfServices {
    var telefoneNumber: String
    var brendName: String
    var icon: UIImage?
    var brendImage: UIImage?
    var ratingStars: Double
    var allTypes: [AllTypes]
    init(telefoneNumber: String, brendName: String, icon: UIImage?, brendImage: UIImage?, ratingStars: Double, allTypes: [AllTypes]) {
        self.telefoneNumber = telefoneNumber
        self.brendName = brendName
        self.icon = icon
        self.brendImage = brendImage
        self.ratingStars = ratingStars
        self.allTypes = allTypes
    }
}
class AllTypes {
    var name: String
    var adress: String
    var workingTime: String
    var telefoneNumber: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, adress: String, workingTime: String, telefoneNumber: String, latitude: Double, longitude: Double) {
        self.name = name
        self.adress = adress
        self.workingTime = workingTime
        self.telefoneNumber = telefoneNumber
        self.latitude = latitude
        self.longitude = longitude
    }
}
