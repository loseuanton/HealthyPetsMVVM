//
//  UIView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import Foundation
import UIKit


extension UIView {
    func gradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(displayP3Red: 0.64, green: 0.96, blue: 0.83, alpha: 1.0).cgColor, UIColor(displayP3Red: 0.71, green: 0.81, blue: 1.0, alpha: 1.0).cgColor]
        //gradient.cornerRadius = 13
        gradient.zPosition = -1
        self.layer.addSublayer(gradient)
        
    }
    func missedGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(red: 0.935, green: 0.643, blue: 0.961, alpha: 1).cgColor, UIColor(red: 1, green: 0.554, blue: 0.554, alpha: 1).cgColor]
        //gradient.cornerRadius = 13
        gradient.zPosition = -1
        self.layer.addSublayer(gradient)
    }
    
    
}
