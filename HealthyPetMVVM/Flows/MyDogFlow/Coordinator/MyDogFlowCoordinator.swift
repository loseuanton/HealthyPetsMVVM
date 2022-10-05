//
//  MyDogFlowCoordinator.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import Foundation
import UIKit
class MyDogFlowCoordinator {
    var tabBarController: UITabBarController
    
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.tabBarController.tabBar.backgroundColor = UIColor(displayP3Red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        self.tabBarController.tabBar.unselectedItemTintColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
    }
    
    func start() {
        openTabBarController()
    }
    func openTabBarController() {
        
        
        guard let myDogVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyDogViewController") as? MyDogViewController else { return }
        myDogVC.tabBarItem.title = "Моя Собака"
        myDogVC.tabBarItem.image = UIImage(named: "pawIcon")
        myDogVC.openAddNewDogScreen = { [weak self] in
            self?.openAddNewDogViewController()
        }
        myDogVC.openEditProfileDogScreen = { [weak self] newDog in
            self?.openEditProfileDogViewController(from: myDogVC, newDog: newDog)
        }
        
        
        guard let healthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HealthViewController") as? HealthViewController else { return }
        healthVC.tabBarItem.title = "Здоровье"
        healthVC.tabBarItem.image = UIImage(named: "heartIcon")
        healthVC.openNextScreen = { [weak self] title in
            self?.openReminderViewController(from: healthVC, title: title)
                        
        }
        
        
        
        guard let settingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
        settingsVC.tabBarItem.title = "Настройки"
        settingsVC.tabBarItem.image = UIImage(named: "settingsIcon")
        
       
        
        tabBarController.setViewControllers([UINavigationController(rootViewController: myDogVC), UINavigationController(rootViewController: healthVC), UINavigationController(rootViewController: settingsVC)], animated: false)
        
    }
    func openAddNewDogViewController() {
        
        guard let addNewDogVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewDogViewController") as? AddNewDogViewController else { return }
        addNewDogVC.openListOfDogs = { [weak self] in
            self?.openListOfDogsViewController(from: addNewDogVC)
        }
        
        let navigationController = UINavigationController(rootViewController: addNewDogVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.tabBarController.present(navigationController, animated: true)
       
   
    }
    func openListOfDogsViewController(from: UIViewController) {
        guard let listOfDogsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListOfDogsViewController") as? ListOfDogsViewController else { return }
        let navigationController = UINavigationController(rootViewController: listOfDogsVC)
        from.navigationController?.present(navigationController, animated: true)
        
    }
    func openReminderViewController(from: UIViewController, title: String) {
        guard let reminderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReminderViewController") as? ReminderViewController else { return }
        
        reminderVC.navigationItem.title = title
        reminderVC.openRepeatsScreen = { [weak self] in
            self?.openRepeatViewController(from: reminderVC)

        }
        
        
        
        from.navigationController?.pushViewController(reminderVC, animated: true)
    }
    func openEditProfileDogViewController(from: UIViewController, newDog: NewDog) {
        guard let editProfileDogVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileDogViewController") as? EditProfileDogViewController else { return }
        //print("\(newDog) копия")
        editProfileDogVC.viewModel.editDog = newDog
        editProfileDogVC.viewModel.editDogCopy = newDog.copyNewDog()
        from.navigationController?.pushViewController(editProfileDogVC, animated: true)
        
    }
    func openRepeatViewController(from: UIViewController) {
        guard let repeatVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepeatViewController") as? RepeatViewController else { return }
        //repeatVC.completionHendler = { [weak self] repeats in
          //  guard let vc = from as? ReminderViewController else { return }
            //вызвать функцию апдейта
            //vc.
                    
        //}
        let navigationController = UINavigationController(rootViewController: repeatVC)
        from.navigationController?.present(navigationController, animated: true)
    }
}

