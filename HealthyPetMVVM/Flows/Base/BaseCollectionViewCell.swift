//
//  BaseCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import UIKit

protocol BaseConfigureCollectionCellRowProtocol {
    var cellIdentifier: String { get set }
}

protocol BaseCollectioniewCellProtocol {
    func configure(item: BaseConfigureCollectionCellRowProtocol)
}

class BaseCollectionViewCell: UICollectionViewCell, BaseCollectioniewCellProtocol {
    
    func configure(item: BaseConfigureCollectionCellRowProtocol) {
        
    }
}
