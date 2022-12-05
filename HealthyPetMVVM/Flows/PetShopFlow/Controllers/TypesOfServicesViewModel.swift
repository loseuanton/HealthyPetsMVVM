//
//  TypesOfServicesViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 17.11.22.
//
import Foundation
import UIKit
enum TypesServices {
    case shop
    case vetcilic
    case grooming
}


class TypesOfServicesViewModel {
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    
    
    func loadTableCells(for type: TypesServices) {
        let typesOfServicesItems: [TypesOfServicesTableViewCellItem]
        switch type {
        case .shop:
            typesOfServicesItems = self.generatePetShopTableViewCellItem()
        case .vetcilic:
            typesOfServicesItems = self.generatePetVetclinicTableViewCellItem()
        case .grooming:
            typesOfServicesItems = self.generatePetGroomingTableViewCellItem()
        }
        self.complitionTableLoadData?(typesOfServicesItems)
        
    }
   // var shopArray: [PetShopArray] = []
  
    func generatePetShopTableViewCellItem() -> [TypesOfServicesTableViewCellItem] {
       // if shopArray.count == 0 {
            var typesOfServicesArray: [TypesOfServices] = []
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "+375291555555", brendName: "Гарфилд", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "garfieldLogo"), ratingStars: 4.5, allTypes: [
            AllTypes(name: "Гарфилд-1", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.94, longitude: 27.7),
            AllTypes(name: "Гарфилд-2", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.73, longitude: 27.7)]))
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "ZOOбазар", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "zoobazarLogo"), ratingStars: 3.25, allTypes: [
            AllTypes(name: "ZOOбазар-3", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.1, longitude: 27.7),
            AllTypes(name: "ZOOбазар-4", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.2, longitude: 27.7)]))
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "ZOOмаркет", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "zoomarketLogo"), ratingStars: 2.7, allTypes: [
            AllTypes(name: "ZOOмаркет-5", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.3, longitude: 27.7),
            AllTypes(name: "ZOOмаркет-6", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.4, longitude: 27.7)]))
           // self.shopArray = petShopArray
        //}
        var tableItemsArray: [TypesOfServicesTableViewCellItem] = []
        for typesOfServicesArray in typesOfServicesArray {
            tableItemsArray.append(TypesOfServicesTableViewCellItem(cellIdentifier: "TypesOfServicesTableViewCellItem", typesOfServices: typesOfServicesArray))
        }
        return tableItemsArray
    }
    func generatePetVetclinicTableViewCellItem() -> [TypesOfServicesTableViewCellItem] {
        //if shopArray.count == 0 {
            var typesOfServicesArray: [TypesOfServices] = []
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "SAS", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "garfieldLogo"), ratingStars: 4, allTypes: [
            AllTypes(name: "SAS-1", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.5, longitude: 27.7),
            AllTypes(name: "SAS-2", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.6, longitude: 27.7)]))
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "Alfavet", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "zoobazarLogo"), ratingStars: 5, allTypes: [
            AllTypes(name: "Alfavet-1", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.7, longitude: 27.7),
            AllTypes(name: "Alfavet-2", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.8, longitude: 27.7)]))
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "Alfa", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "zoomarketLogo"), ratingStars: 3, allTypes: [
            AllTypes(name: "Alfa-1", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.13, longitude: 27.7),
            AllTypes(name: "Alfa-2", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.25, longitude: 27.7)]))
          //  self.shopArray = petShopArray
       // }
        var tableItemsArray: [TypesOfServicesTableViewCellItem] = []
        for typesOfServicesArray in typesOfServicesArray {
            tableItemsArray.append(TypesOfServicesTableViewCellItem(cellIdentifier: "TypesOfServicesTableViewCellItem", typesOfServices: typesOfServicesArray))
        }
        return tableItemsArray
    }
    func generatePetGroomingTableViewCellItem() -> [TypesOfServicesTableViewCellItem] {
        //if shopArray.count == 0 {
            var typesOfServicesArray: [TypesOfServices] = []
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "1", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "garfieldLogo"), ratingStars: 2, allTypes: [
            AllTypes(name: "1-1", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.94, longitude: 27.1),
            AllTypes(name: "1-2", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.94, longitude: 27.2)]))
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "2", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "zoobazarLogo"), ratingStars: 5, allTypes: [
            AllTypes(name: "2-1", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.94, longitude: 27.3),
            AllTypes(name: "2-2", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.94, longitude: 27.4)]))
        typesOfServicesArray.append(TypesOfServices(telefoneNumber: "375291555555", brendName: "3", icon: UIImage(named: "dogWithGroceryBag"), brendImage: UIImage(named: "zoomarketLogo"), ratingStars: 4, allTypes: [
            AllTypes(name: "3-1", adress: "пр. Независимости 168/1, Минск-1", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.94, longitude: 27.5),
            AllTypes(name: "4-2", adress: "пр. Независимости 168/1, Минск-2", workingTime: "Время работы: ежедневно с 9 до 21", telefoneNumber: "+375 (44) 568-25-99", latitude: 53.94, longitude: 27.6)]))
            //self.shopArray = petShopArray
       // }
        var tableItemsArray: [TypesOfServicesTableViewCellItem] = []
        for typesOfServicesArray in typesOfServicesArray {
            tableItemsArray.append(TypesOfServicesTableViewCellItem(cellIdentifier: "TypesOfServicesTableViewCellItem", typesOfServices: typesOfServicesArray))
        }
        return tableItemsArray
    }
//    func filterArray(text: String) {
//        let filterArray = shopArray.filter { petShopArray in
//            return petShopArray.brendName.uppercased().contains(text.uppercased())
//        }
//        var tableItemsArray: [PetShopTableViewCellItem] = []
//        for petShopArray in filterArray {
//            tableItemsArray.append(PetShopTableViewCellItem(cellIdentifier: "PetShopTableViewCellItem", petShopArray: petShopArray))
//        }
//        self.complitionTableLoadData?(tableItemsArray)
//    }
}
