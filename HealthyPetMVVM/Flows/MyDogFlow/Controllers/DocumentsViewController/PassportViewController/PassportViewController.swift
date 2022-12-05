//
//  PassportViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 6.11.22.
//

import UIKit
import SnapKit


class PassportViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UIGestureRecognizerDelegate {
  
    // MARK: - Views
    var rootView = PassportView()
    let viewModel = PassportViewModel()
    var newPassport = NewDogServices()
    
   
    
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
       
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rootView.gradient()
        print(viewModel.passport)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Configure Views
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        navigationItem.title = "Паспорт питомца"
        if let passportImage = viewModel.passport?.imagePassport {
            rootView.passportImage.image = UIImage(data: passportImage as Data)
        }
        rootView.passportImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openAlertPhoto))
        rootView.passportImage.addGestureRecognizer(tapGesture)
        
        
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        
        let rightBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rightBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rightBarButton
        rootView.rightBarButton.addTarget(self, action: #selector(savePassport), for: .touchUpInside)
       
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        
        
        
    }
    
    
    // MARK: - Action Buttons
    @objc func closeScreen() {
        
       
        self.navigationController?.popViewController(animated: true)
    }
    @objc func savePassport() {
        if let passport = viewModel.passport {
            newPassport.saveEditDog(newDog: passport)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func openAlertPhoto(sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let defaultButton = UIAlertAction(title: "Сделать фото", style: .default) { _ in
            self.getImageGo(type: 1)
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(defaultButton)
        let cancelButton = UIAlertAction(title: "Выбрать фото", style: .default) { action in
            self.getImageGo(type: 2)
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelButton)
        let destructiveButton = UIAlertAction(title: "Отмена", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(destructiveButton)
        alert.view.tintColor = UIColor(red: 0.56, green: 0, blue: 1, alpha: 1)
        present(alert, animated: true, completion: nil)
    }
    func getImageGo(type: Int) {
        rootView.takingPicture =  UIImagePickerController.init()
        if (type == 1) {
            rootView.takingPicture.sourceType = .camera
        }else if( type == 2) {
            rootView.takingPicture.sourceType = .photoLibrary
        }
        rootView.takingPicture.allowsEditing = false
        rootView.takingPicture.delegate = self
        present(rootView.takingPicture, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        rootView.takingPicture.dismiss(animated: true, completion: nil)
        if (rootView.takingPicture.allowsEditing == false) {
            // Исходное изображение
            rootView.passportImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            let data = NSData(data: (rootView.passportImage.image?.jpegData(compressionQuality: 0.9))!)
            
            viewModel.passport?.imagePassport = data as Data
        } else {
            //Снимок экрана
            rootView.passportImage.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            let data = NSData(data: (rootView.passportImage.image?.jpegData(compressionQuality: 0.9))!)
            
            viewModel.passport?.imagePassport = data as Data
        }
        
    }
   
}
