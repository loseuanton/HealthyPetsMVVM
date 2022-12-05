//
//  TypesOfServicesView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 17.11.22.
//

import Foundation
import UIKit
import SnapKit


class TypesOfServicesView: UIView {
    var backgroundView = UIView()
    var searchBar = UISearchController(searchResultsController: nil)
    var segmentedControl = UISegmentedControl(items: ["Зоомагазин", "Ветклиника", "Груминг"])
    var tableView = UITableView()
    var currentShopType: TypesServices?
    
    func decorate() {
        searchBar.searchBar.barTintColor = .white
        searchBar.searchBar.isTranslucent = false
       
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)], for: .selected)
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = UIColor.clear
        tableView.isHidden = false
        
    }
    func addSubviews() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(segmentedControl)
        backgroundView.addSubview(tableView)
        
        
    }
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
           
            make.top.bottom.right.left.equalToSuperview()
        }
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(4.VAdapted)
            make.left.equalTo(backgroundView.snp.left).offset(16.HAdapted)
            make.right.equalTo(backgroundView.snp.right).inset(16.HAdapted)
            make.size.equalTo(32.VAdapted)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(8.VAdapted)
            make.bottom.right.left.equalToSuperview()
        }
    }
}
