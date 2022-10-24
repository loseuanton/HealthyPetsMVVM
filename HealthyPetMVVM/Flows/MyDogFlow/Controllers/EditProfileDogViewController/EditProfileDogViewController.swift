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
    var openListOfDogScreen: (() -> Void)?
    
    
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
        rootView.pickerGender.delegate = self
        rootView.pickerGender.dataSource = self
        rootView.pickerAge.delegate = self
        rootView.pickerAge.dataSource = self
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
        let alert = UIAlertController(title: "Вы уверены, что хотите удалить профиль собаки?", message: "Все данные будут удалены.", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Отмена", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        let yesButton = UIAlertAction(title: "Да", style: .default) { _ in
            self.newDogServices.removeDog(dog: self.viewModel.editDog!)
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(cancelButton)
        alert.addAction(yesButton)
        present(alert, animated: true, completion: nil)
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
    func updateDogBreed(breed: String) {
        viewModel.updateDogBreed(breed: breed)
        print("\(breed) breed")
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
            rootView.pickerAgeOff()
            rootView.changeStatePickerGender()
            
        } else if indexPath.row == 2 {
            rootView.pickerGenderOff()
            rootView.changeStatePickerAge()
            
            
        } else if indexPath.row == 3 {
            rootView.pickerAgeOff()
            rootView.pickerGenderOff()
            openListOfDogScreen?()
        } else {
            rootView.pickerAgeOff()
            rootView.pickerGenderOff()
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
        if pickerView === rootView.pickerGender {
            return 1
        } else {
            return 4
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView === rootView.pickerGender {
            return 2
        } else {
            if component == 0 {
                return 26
            } else if component == 1 {
                return 1
            } else if component == 2 {
                return 12
            } else {
                return 1
            }
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView === rootView.pickerGender {
            if row == 0 {
                let text =  UILabel()
                text.customBlackText(nameFont: "SFProDisplay-Regular", sizeFont: 23, text: "Мужской", letter: 0.7)
                text.textAlignment = .center
                
                return text
            } else {
                let text =  UILabel()
                text.customBlackText(nameFont: "SFProDisplay-Regular", sizeFont: 23, text: "Женский", letter: 0.7)
                text.textAlignment = .center
                
                return text
            }
        } else {
            if component == 0 {
                let text =  UILabel()
                text.customBlackText(nameFont: "SFProDisplay-Regular", sizeFont: 23, text: "\(row)", letter: 0.7)
                text.textAlignment = .center
                
                return text
            }
            if component == 1 {
                let text =  UILabel()
                text.customBlackText(nameFont: "SFProDisplay-Regular", sizeFont: 23, text: "года", letter: 0.7)
                text.textAlignment = .left
                
                return text
            }
            if component == 2 {
                let text =  UILabel()
                text.customBlackText(nameFont: "SFProDisplay-Regular", sizeFont: 23, text: "\(row)", letter: 0.7)
                text.textAlignment = .center
                
                return text
            }
            if component == 3 {
                let text =  UILabel()
                text.customBlackText(nameFont: "SFProDisplay-Regular", sizeFont: 23, text: "месяцев", letter: 0.7)
                text.textAlignment = .left
                
                return text
            }
            return UIView()
        }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if pickerView === rootView.pickerGender {
            return UIScreen.main.bounds.width
        } else {
            if component == 0 {
                return UIScreen.main.bounds.width / 6
            }
            if component == 1 {
                return UIScreen.main.bounds.width / 4
            }
            if component == 2 {
                return UIScreen.main.bounds.width / 6
            }
            if component == 3 {
                return UIScreen.main.bounds.width / 4
            }
            return 0.0
        }
        }
        
    
    
    
}
extension EditProfileDogViewController: UIPickerViewDelegate {
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView === rootView.pickerGender {
            if row == 0 {
                return "Мужской"
            } else {
                return "Женский"
            }
            
        } else {
            if component == 0 {
                return "\(row)"
            }
            if component == 1 {
                return "Года"
            }
            if component == 2 {
                return "\(row)"
            }
            if component == 3 {
                return "Месяцев"
            }
            return ""
        }
        
    }
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if pickerView === rootView.pickerGender {
            if row == 0 {
                viewModel.updateDogGender(gender: "Мужской")
                
            }
            if row == 1 {
                viewModel.updateDogGender(gender: "Женский")
            }
            
        } else {
            if component == 0 {
                viewModel.updateDogYearsAge(age: row)
            }
            if component == 2 {
                viewModel.updateDogMonthAge(age: row)
            }
            
        }
    }
    
    
}

