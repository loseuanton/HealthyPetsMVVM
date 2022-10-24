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
        myDogVC.tabBarItem.title = NSLocalizedString("myDog", comment: "")
        myDogVC.tabBarItem.image = UIImage(named: "pawIcon")
        myDogVC.openAddNewDogScreen = { [weak self] in
            self?.openAddNewDogViewController()
        }
        myDogVC.openEditProfileDogScreen = { [weak self] newDog in
            self?.openEditProfileDogViewController(from: myDogVC, newDog: newDog)
        }
        
        
        guard let healthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HealthViewController") as? HealthViewController else { return }
        healthVC.tabBarItem.title = "Здоровье"
        healthVC.tabBarItem.title = NSLocalizedString("health", comment: "")
        healthVC.tabBarItem.image = UIImage(named: "heartIcon")
        healthVC.newTitle = { [weak self] title, image in
            self?.openReminderViewController(from: healthVC, title: title, image: (image ?? UIImage(named: "careImage-1"))!)
                        
        }
        
        healthVC.openEditReminderScreen = { [weak self] reminder in
            self?.openEditReminderViewController(from: healthVC, reminder: reminder)
        }
        
        
        
        guard let settingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
        settingsVC.tabBarItem.title = "Настройки"
        settingsVC.tabBarItem.title = NSLocalizedString("settings", comment: "")
        settingsVC.tabBarItem.image = UIImage(named: "settingsIcon")
        
       
        
        tabBarController.setViewControllers([UINavigationController(rootViewController: myDogVC), UINavigationController(rootViewController: healthVC), UINavigationController(rootViewController: settingsVC)], animated: false)
        
    }
    func openAddNewDogViewController() {
        
        guard let addNewDogVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewDogViewController") as? AddNewDogViewController else { return }
        // TODO: вопрос 3 по выбору породы
        addNewDogVC.openListOfDogs = { [weak self] complition in
            self?.openListOfDogsViewController(from: addNewDogVC, complition: complition)
        }
        
        let navigationController = UINavigationController(rootViewController: addNewDogVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.tabBarController.present(navigationController, animated: true)
       
   
    }
    // TODO: вопрос 3 по выбору породы
    func openListOfDogsViewController(from: UIViewController, complition: ((String?) -> Void)? = nil) {
        guard let listOfDogsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListOfDogsViewController") as? ListOfDogsViewController else { return }
        listOfDogsVC.completionHendler = { [weak self] dog in
            guard let vc = from as? EditProfileDogViewController else { return }
            vc.updateDogBreed(breed: dog)
            
        }
        listOfDogsVC.doneSelectDog = complition
        let navigationController = UINavigationController(rootViewController: listOfDogsVC)
        from.navigationController?.present(navigationController, animated: true)
        
    }
    func openReminderViewController(from: UIViewController, title: String, image: UIImage?) {
        guard let reminderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReminderViewController") as? ReminderViewController else { return }
        
        reminderVC.navigationItem.title = title
        reminderVC.rootView.imageReminder.image = image
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
        editProfileDogVC.openListOfDogScreen = { [weak self] in
            self?.openListOfDogsViewController(from: editProfileDogVC)
        }
        from.navigationController?.pushViewController(editProfileDogVC, animated: true)
        
    }
    func openRepeatViewController(from: UIViewController) {
        guard let repeatVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepeatViewController") as? RepeatViewController else { return }
        repeatVC.completionHendler = { [weak self] repeats in
            guard let vc = from as? ReminderViewController else { return }
            //вызвать функцию апдейта
            vc.updateRepeatText(text: repeats)
            
        }
        let navigationController = UINavigationController(rootViewController: repeatVC)
        from.navigationController?.present(navigationController, animated: true)
    }
    func openEditReminderViewController(from: UIViewController, reminder: Reminder) {
        guard let editReminderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditReminderViewController") as? EditReminderViewController else { return }
       
        editReminderVC.viewModel.editReminder = reminder
        editReminderVC.viewModel.editReminderCopy = reminder.copyReminder()
        from.navigationController?.pushViewController(editReminderVC, animated: true)
        
    }
}

