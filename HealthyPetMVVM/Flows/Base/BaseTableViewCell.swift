//
//  BaseTableViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 12.08.22.
//

import UIKit

protocol BaseConfigureTableCellRowProtocol {
    var cellIdentifier: String { get set }
}

protocol BaseTableiewCellProtocol {
    func configure(item: BaseConfigureTableCellRowProtocol)
}

class BaseTableViewCell: UITableViewCell, BaseTableiewCellProtocol {
    
    func configure(item: BaseConfigureTableCellRowProtocol) {
        
    }
}

