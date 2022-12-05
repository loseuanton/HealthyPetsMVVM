//
//  DocumentsView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.11.22.
//

import Foundation
import UIKit
import SnapKit


class DocumentsView: UIView {
    var backgroundView = UIView()
    var documentsTableView = UITableView()
   
    
    func decorate() {
        
        
        documentsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        documentsTableView.layer.cornerRadius = 10
        documentsTableView.clipsToBounds = true
        documentsTableView.isScrollEnabled = false
     
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(documentsTableView)
       
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        documentsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(24.VAdapted)
            make.size.equalTo([358, 120].HResized)
            make.centerX.equalToSuperview()
        }
        
    }
}

