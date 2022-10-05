//
//  ListOfDogsView.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 14.08.22.
//

import Foundation
import UIKit
import SnapKit


class ListOfDogsView: UIView {
    var filterData: [String] = []
    var leftBarButton = UIButton()
    var rightBarButton = UIButton()
    var searchBar = UISearchBar()
    var listOfDogsTableView = UITableView()
    func decorate() {
        self.backgroundColor = .white
        leftBarButton.setTitle("Отмена", for: .normal)
        leftBarButton.setTitleColor(UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1), for: .normal)
        
        
        rightBarButton.setTitle("Готово", for: .normal)
        rightBarButton.setTitleColor(UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1), for: .normal)
        
        searchBar.placeholder = "Поиск"
        searchBar.searchBarStyle = .minimal
        searchBar.layer.cornerRadius = 10
    }
    func addSubviews() {
        self.addSubview(searchBar)
        self.addSubview(listOfDogsTableView)
    }
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.snp.left).offset(16.HAdapted)
            make.right.equalTo(self.snp.right).offset(-16.HAdapted)
            make.height.equalTo(36.VAdapted)
        }
        listOfDogsTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(31.VAdapted)
            make.bottom.right.left.equalToSuperview()
            
        }
    }
}

