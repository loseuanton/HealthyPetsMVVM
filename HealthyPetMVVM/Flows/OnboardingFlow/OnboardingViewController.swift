//
//  OnboardingViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 29.10.22.
//

import Foundation
import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    var centerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerButton.backgroundColor = .black
        centerButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(centerButton)
        centerButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.size.equalTo([40, 40].HResized)
        }
        
    }
    @objc func continueButton() {
        UserDefaults.standard.hasOnboarded = true
        print("touch")
    }
}
