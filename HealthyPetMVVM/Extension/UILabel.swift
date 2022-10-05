//
//  UILabel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import Foundation
import UIKit

extension UILabel {
    func customBlackText(nameFont: String, sizeFont: Int, text: String, letter: Double ) {
        self.numberOfLines = 0
        self.font = UIFont(name: nameFont, size: CGFloat(sizeFont).adaptedFontSize)
        self.attributedText = NSMutableAttributedString(string: text, attributes: [NSMutableAttributedString.Key.kern: letter])
        self.textColor = .black
    }
}

