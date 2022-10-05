//
//  EditProfileDogViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 27.08.22.
//

import UIKit
import SnapKit

class EditProfileDogViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var changeDogImage: ((UIImage?) -> Void)?
    
    
    // MARK: - Views
    var rootView = EditProfileDogView()
    var viewModel = EditProfileDogViewModel()
    var items: [BaseConfigureTableCellRowProtocol] = []
    var newDogServices = NewDogServices()
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.editProfileTableView.register(EditNicknameTableViewCell.self, forCellReuseIdentifier: "EditNicknameTableViewCellItem")
        rootView.editProfileTableView.register(EditGenderTableViewCell.self, forCellReuseIdentifier: "EditGenderTableViewCellItem")
        rootView.editProfileTableView.register(EditAgeTableViewCell.self, forCellReuseIdentifier: "EditAgeTableViewCellItem")
        rootView.editProfileTableView.register(EditBreedsTableViewCell.self, forCellReuseIdentifier: "EditBreedsTableViewCellItem")
        rootView.editProfileTableView.delegate = self
        rootView.editProfileTableView.dataSource = self
        rootView.picker.delegate = self
        rootView.picker.dataSource = self
        viewModel.changeDogImage = self.changeDogImage
        configureView()
        bindingViewModel()
        viewModel.loadTableCells()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        rootView.backgroundView.gradient()
        rootView.centralDogIcon.layer.cornerRadius = rootView.centralDogIcon.bounds.size.height / 2.0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        bindingViewModel()
        print("\(viewModel.editDog) ggggg")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        
        rootView.centralDogIcon.image = UIImage(data: viewModel.editDogCopy!.imageDog as Data)
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        
        let rightBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rightBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rightBarButton
        rootView.rightBarButton.addTarget(self, action: #selector(saveEditDog), for: .touchUpInside)
        
        navigationItem.title = "Редактировать"
        
        rootView.centralDogIcon.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openAlertPhoto))
        rootView.centralDogIcon.addGestureRecognizer(tapGesture)
        rootView.deleteProfileButton.addTarget(self, action: #selector(deleteEditDog), for: .touchUpInside)
        
    }
    
    func bindingViewModel() {
        viewModel.complitionTableLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.editProfileTableView.reloadData()
            
        }
    }
    @objc func deleteEditDog() {
        newDogServices.removeDog(dog: viewModel.editDog!)
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func closeScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func saveEditDog() {
        newDogServices.saveEditDog(newDog: viewModel.editDogCopy!)
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
            rootView.centralDogIcon.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            let data = NSData(data: (rootView.centralDogIcon.image?.jpegData(compressionQuality: 0.9))!)
            
            viewModel.editDogCopy?.imageDog = data as Data
        } else {
            //Снимок экрана
            rootView.centralDogIcon.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            let data = NSData(data: (rootView.centralDogIcon.image?.jpegData(compressionQuality: 0.9))!)
            
            viewModel.editDogCopy?.imageDog = data as Data
        }
        
    }
}
extension EditProfileDogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: BaseConfigureTableCellRowProtocol = items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as? BaseTableViewCell {
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.configure(item: item)
           
            
            
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            view.addSubview(rootView.picker)
            rootView.picker.snp.makeConstraints { make in
                make.height.equalTo(216.VAdapted)
                make.left.equalTo(view.snp.left).offset(0.HAdapted)
                make.right.equalTo(view.snp.right).offset(0.HAdapted)
                make.bottom.equalTo(view.snp.bottom).offset(0.VAdapted)
                
            }
        } else {
            rootView.picker.removeFromSuperview()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = rootView.editProfileTableView.bounds.height / 4.0
       
        return height
    }
    
}
extension EditProfileDogViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    
}
extension EditProfileDogViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "Мужской"
        } else {
            return "Женский"
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            viewModel.updateDogYearsAge(gender: "Мужской")
            
        }
        if row == 1 {
            viewModel.updateDogYearsAge(gender: "Женский")
        }
        
    }
    
}

