//
//  CustomViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 7.11.22.
//

import UIKit
struct Section {
    let title: String
    let options: [Int]
    let subTitle: String
    var isOpened: Bool = false
    
    init(title: String, options: [Int], subTitle: String, isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.subTitle = subTitle
        self.isOpened = isOpened
    }
}

class CustomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [
            Section(title: "Section 1", options: [1], subTitle: "1"),
            Section(title: "Section 2", options: [1], subTitle: "2")
        ]
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .systemBlue
        } else {
            cell.textLabel?.text = sections[indexPath.section].subTitle
            cell.backgroundColor = .brown
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            print("tapped sub cell")
        }
    }
    
}
