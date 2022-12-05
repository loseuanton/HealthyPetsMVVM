//
//  DocumentsViewModel.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.11.22.
//

import Foundation
import UIKit

class DocumentsViewModel {
    var documents: NewDog?
    var documentsCopy: NewDog?
    var complitionTableLoadData: (([BaseConfigureTableCellRowProtocol]) -> Void)?
    
    
    func loadTableCells() {
        
        let documentsTableViewCellItem = self.generateDocumentsTableViewCellItem()
        self.complitionTableLoadData?(documentsTableViewCellItem)
   
    }
    func generateDocumentsTableViewCellItem() -> [DocumentsTableViewCellItem] {
        var documents: [Documents] = []
        documents.append(Documents(passportAndMedicalBook: "Паспорт питомца", documentsIcon: UIImage(named: "passportIcon"), isOpened: false, subTitle: "1", options: [1]))
        documents.append(Documents(passportAndMedicalBook: "Медицинская книга", documentsIcon: UIImage(named: "medicalBookIcon"), isOpened: false, subTitle: "2", options: [1]))
        
        var tableItemsArray: [DocumentsTableViewCellItem] = []
        for documents in documents {
            tableItemsArray.append(DocumentsTableViewCellItem(cellIdentifier: "DocumentsTableViewCellItem", documents: documents))
        }
        return tableItemsArray
        
    }
}
