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
        self.tabBarController.tabBar.tintColor = UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1)
        
    }
    
    func start() {
        openTabBarController()
    }
    func openTabBarController() {
        
        
        guard let myDogVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyDogViewController") as? MyDogViewController else { return }
        myDogVC.tabBarItem.title = "Моя Питомец"
        myDogVC.tabBarItem.title = NSLocalizedString("myDog", comment: "")
        myDogVC.tabBarItem.image = UIImage(named: "pawIcon")
        myDogVC.openAddNewDogScreen = { [weak self] in
            self?.openAddNewDogViewController()
        }
        myDogVC.openEditProfileDogScreen = { [weak self] newDog in
            self?.openEditProfileDogViewController(from: myDogVC, newDog: newDog)
        }
        myDogVC.openDocumentsScreen = { [weak self] newDog in
            self?.openDocumentsViewController(from: myDogVC, newDog: newDog)
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
        healthVC.openHistoryReminderScreen = { [weak self] in
            self?.openHistoryReminderViewController(from: healthVC)
        }
        
        guard let typeOfServicesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TypesOfServicesViewController") as? TypesOfServicesViewController else { return }
        typeOfServicesVC.tabBarItem.title = "Зоомагазин"
        typeOfServicesVC.tabBarItem.image = UIImage(named: "petShopIcon")
        typeOfServicesVC.openAllTypesScreen = { [weak self] typeOfServices in
            self?.openAllTypesViewController(from: typeOfServicesVC, typeOfService: typeOfServices)
        }
        
        
        
        guard let settingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
        settingsVC.tabBarItem.title = "Настройки"
        settingsVC.tabBarItem.title = NSLocalizedString("settings", comment: "")
        settingsVC.tabBarItem.image = UIImage(named: "settingsIcon")
        
       
        
        tabBarController.setViewControllers([UINavigationController(rootViewController: myDogVC), UINavigationController(rootViewController: healthVC), UINavigationController(rootViewController: typeOfServicesVC), UINavigationController(rootViewController: settingsVC)], animated: false)
        
    }
    
    func openAddNewDogViewController() {
        
        guard let addNewDogVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewDogViewController") as? AddNewDogViewController else { return }
        // TODO: вопрос 3 по выбору породы
//        addNewDogVC.openListOfDogs = { [weak self] complition in
//            self?.openListOfDogsViewController(from: addNewDogVC, complition: complition)
//        }
        addNewDogVC.openListOfBreeds = { [weak self] petType in
            self?.openListOfDogsViewController(from: addNewDogVC, petType: petType)
        }
        
        let navigationController = UINavigationController(rootViewController: addNewDogVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.tabBarController.present(navigationController, animated: true)
       
   
    }
    // TODO: вопрос 3 по выбору породы
    func openListOfDogsViewController(from: UIViewController, petType: PetType) {
        guard let listOfDogsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListOfDogsViewController") as? ListOfDogsViewController else { return }
        listOfDogsVC.completionHendler = { [weak self] dog in
            guard let vc = from as? EditProfileDogViewController else { return }
            vc.updateDogBreed(breed: dog ?? "Другая порода")
            
        }
        listOfDogsVC.rootView.currentPetType = petType
        //listOfDogsVC.doneSelectDog = complition
        listOfDogsVC.doneSelectDog = { [weak self] breed in
            guard let vc = from as? AddNewDogViewController else { return }
            vc.updateBreedText(text: breed ?? "Метис")
        }
        
        let navigationController = UINavigationController(rootViewController: listOfDogsVC)
        from.navigationController?.present(navigationController, animated: true)
        
    }
    func openReminderViewController(from: UIViewController, title: String, image: UIImage?) {
        guard let reminderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReminderViewController") as? ReminderViewController else { return }
        
        reminderVC.navigationItem.title = title
        reminderVC.rootView.titleLabel.text = title
        reminderVC.rootView.imageReminder.image = image
        reminderVC.openRepeatsScreen = { [weak self] in
            self?.openRepeatViewController(from: reminderVC)

        }
        from.navigationController?.pushViewController(reminderVC, animated: true)
    }
    func openEditProfileDogViewController(from: UIViewController, newDog: NewDog) {
        guard let editProfileDogVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileDogViewController") as? EditProfileDogViewController else { return }
        editProfileDogVC.viewModel.editDog = newDog
        editProfileDogVC.viewModel.editDogCopy = newDog.copyNewDog()
//        editProfileDogVC.openListOfDogScreen = { [weak self] in
//            self?.openListOfDogsViewController(from: editProfileDogVC)
//        }
        editProfileDogVC.openListOfBreeds = { [weak self] petType in
            self?.openListOfDogsViewController(from: editProfileDogVC, petType: petType)
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
    func openHistoryReminderViewController(from: UIViewController) {
        guard let historyReminderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryReminderViewController") as? HistoryReminderViewController else { return }
        historyReminderVC.openDescriptionHistoryReminderScreen = { [weak self] historyReminder in
            self?.openDescriptionHistoryReminderViewController(from: historyReminderVC, historyReminder: historyReminder)
        }
        
        from.navigationController?.pushViewController(historyReminderVC, animated: true)
        
    }
    func openDescriptionHistoryReminderViewController(from: UIViewController, historyReminder: HistoryReminder) {
        guard let descriptionHistoryReminderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DescriptionHistoryReminderViewController") as? DescriptionHistoryReminderViewController else { return }
        descriptionHistoryReminderVC.viewModel.historyReminder = historyReminder
        
        from.navigationController?.pushViewController(descriptionHistoryReminderVC, animated: true)
        
    }
    func openDocumentsViewController(from: UIViewController, newDog: NewDog) {
        guard let documentsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DocumentsViewController") as? DocumentsViewController else { return }
        documentsVC.viewModel.documents = newDog
        documentsVC.viewModel.documentsCopy = newDog.copyNewDog()
        documentsVC.openPassportScreen = { [weak self] newDog in
            self?.openPassportViewController(from: documentsVC, newDog: newDog)
        }
        from.navigationController?.pushViewController(documentsVC, animated: true)
        
    }
    func openPassportViewController(from: UIViewController, newDog: NewDog) {
        guard let passportVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController else { return }
        //passportVC.viewModel.passport = newDog
        
        from.navigationController?.pushViewController(passportVC, animated: true)
        
    }
    func openAllTypesViewController(from: UIViewController, typeOfService: TypesOfServices) {
        guard let allTypesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllTypesViewController") as? AllTypesViewController else { return }
        allTypesVC.viewModel.typesOfServices = typeOfService
        allTypesVC.openMapScreen = { [weak self] allTypes in
            self?.openMapViewController(from: allTypesVC, typeServices: [allTypes])
        }
        allTypesVC.openMarkersMapScreen = { [weak self] allTypes in
            self?.openMapViewController(from: allTypesVC, typeServices: allTypes)
        }
        
        from.navigationController?.pushViewController(allTypesVC, animated: true)
    }
    func openMapViewController(from: UIViewController, typeServices: [AllTypes])  {
        guard let mapVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else { return }
        mapVC.viewModel.typeServices = typeServices
        mapVC.viewModel.allTypesServices = typeServices
        
        from.navigationController?.pushViewController(mapVC, animated: true)
    }
}

