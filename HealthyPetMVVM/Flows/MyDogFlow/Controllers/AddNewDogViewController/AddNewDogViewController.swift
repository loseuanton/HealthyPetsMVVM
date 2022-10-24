//
//  AddNewDogViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 9.08.22.
//

import UIKit

class AddNewDogViewController: UIViewController {
    
    var rootView = AddNewDogView()
    let viewModel = AddNewDogViewModel()
    var items: [BaseConfigureCollectionCellRowProtocol] = []
    // TODO: вопрос 3 по выбору породы
    var openListOfDogs: (( ((String?)->Void)? ) -> Void)?
    var changeDogImage: ((UIImage?) -> Void)?
    var newDogServices = NewDogServices()
   
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.newDogCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rootView.layout)
        rootView.newDogCollectionView.register(NicknameDogCollectionViewCell.self, forCellWithReuseIdentifier: "NicknameDogCollectionViewCellItem")
        rootView.newDogCollectionView.register(GenderDogCollectionViewCell.self, forCellWithReuseIdentifier: "GenderDogCollectionViewCellItem")
        rootView.newDogCollectionView.register(DogAgeCollectionViewCell.self, forCellWithReuseIdentifier: "DogAgeCollectionViewCellItem")
        rootView.newDogCollectionView.register(BreedsDogCollectionViewCell.self, forCellWithReuseIdentifier: "BreedsDogCollectionViewCellItem")
        configureView()
        rootView.newDogCollectionView.delegate = self
        rootView.newDogCollectionView.dataSource = self
        rootView.picker.delegate = self
        rootView.picker.dataSource = self
        viewModel.openListOfDogs = self.openListOfDogs
        viewModel.changeDogImage = { [weak self] changeDogImage in
            self?.changeDogImage = changeDogImage
            self?.openAlertPhoto()
        }
        
        bindingViewModel()
        viewModel.loadCollectionCells()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
       
        
      
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rootView.backgroundView.gradient()
        
        rootView.bgViewForPageControl.layer.cornerRadius = rootView.bgViewForPageControl.bounds.size.height / 2.0
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
    }
    
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        rootView.leftButtonForPageControl.addTarget(self, action: #selector(left), for: .touchUpInside)
        rootView.rightButtonForPageControl.addTarget(self, action: #selector(right), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        
    }
    func bindingViewModel() {
        viewModel.complitionLoadData = { [weak self] items in
            self?.items = items
            self?.rootView.newDogCollectionView.reloadData()
            
        }
    }
    
    
    @objc func left() {
        if rootView.currentPage > 0 {
            rootView.currentPage -= 1
            rootView.newDogCollectionView.scrollToItem(at: NSIndexPath(row: rootView.currentPage, section: 0) as IndexPath, at: .centeredHorizontally, animated: true)
            updatePageControl()
        }
    }
    @objc func right() {
        if rootView.currentPage < rootView.pageControl.numberOfPages && rootView.currentPage != 3 {
            rootView.currentPage += 1
            rootView.newDogCollectionView.scrollToItem(at: NSIndexPath(row: rootView.currentPage, section: 0) as IndexPath, at: .centeredHorizontally, animated: true)
            
            updatePageControl()
        } else if rootView.currentPage == 3 {
            newDogServices.saveNewDog(newDog: viewModel.newDog)
            print(viewModel.newDog)
            dismiss(animated: true)
        }
    }
    func updatePageControl() {
        rootView.pageControl.currentPage = rootView.currentPage
    }
    @objc func closeScreen() {
        self.dismiss(animated: true)
    }
    func openAlertPhoto() {

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
    
    func getImageGo(type: Int){
        rootView.takingPicture =  UIImagePickerController.init()
        if (type == 1) {
            rootView.takingPicture.sourceType = .camera
        } else if( type == 2) {
            rootView.takingPicture.sourceType = .photoLibrary
        }
        rootView.takingPicture.allowsEditing = false
        rootView.takingPicture.delegate = self
        present(rootView.takingPicture, animated: true, completion: nil)
    }
    
}


extension AddNewDogViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        rootView.takingPicture.dismiss(animated: true, completion: nil)
        if (rootView.takingPicture.allowsEditing == false) {
            // Исходное изображение
        
            self.changeDogImage?((info[UIImagePickerController.InfoKey.originalImage] as? UIImage))
        } else {
            //Снимок экрана
            self.changeDogImage?(( info[UIImagePickerController.InfoKey.editedImage] as? UIImage))
        }
        
    }
}


extension AddNewDogViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        rootView.pageControl.currentPage = indexPath.row
        print(indexPath.row)
        
        if indexPath.row == 2 {
            rootView.changeStatePicker()
           
        } else {
            rootView.pickerOff()
        }
    }
}
extension AddNewDogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item: BaseConfigureCollectionCellRowProtocol = items[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cellIdentifier, for: indexPath) as? BaseCollectionViewCell {
            cell.configure(item: item)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}
extension AddNewDogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390.HAdapted, height: 340.VAdapted)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension AddNewDogViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
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
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
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
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
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
extension AddNewDogViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            viewModel.updateDogYearsAge(age: row)
        }
        if component == 2 {
            viewModel.updateDogMonthAge(age: row)
        }
        
    }
    
}

