//
//  Documents.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.11.22.
//

import Foundation
import UIKit

struct Documents {
    var passportAndMedicalBook: String
    var documentsIcon: UIImage?
    var isOpened: Bool
    var subTitle: String
    var options: [Int]
    init(passportAndMedicalBook: String, documentsIcon: UIImage?, isOpened: Bool, subTitle: String, options: [Int]) {
        self.passportAndMedicalBook = passportAndMedicalBook
        self.documentsIcon = documentsIcon
        self.isOpened = isOpened
        self.subTitle = subTitle
        self.options = options
    }
    
}
