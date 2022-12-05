//
//  MapView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 24.11.22.
//

import Foundation
import UIKit
import SnapKit
import GoogleMaps


class MapView: UIView {
    
  var mapView = GMSMapView()
    
    func decorate() {
        self.backgroundColor = .white
        
    }
    func addSubviews() {
        self.addSubview(mapView)
    }
    func configureLayout() {
        mapView.snp.makeConstraints { make in
           
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}
