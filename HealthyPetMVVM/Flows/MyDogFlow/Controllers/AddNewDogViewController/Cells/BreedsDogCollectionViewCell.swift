//
//  BreedsDogCollectionViewCell.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 10.08.22.
//

import Foundation
import UIKit
import SnapKit

class BreedsDogCollectionViewCellItem: BaseConfigureCollectionCellRowProtocol {
    init(){}
    var cellIdentifier = "BreedsDogCollectionViewCellItem"
    var changeDogOrCat: ((String) -> Void)?
    var openListOfBreeds: ((PetType) -> Void)?
    var updateDogBreedComplition: ((String) -> Void)?
    func updateDogBreed(breed: String) {
        updateDogBreedComplition?(breed)
    }
    
}

class BreedsDogCollectionViewCell: BaseCollectionViewCell {
    var item: BreedsDogCollectionViewCellItem?
    var items: [BaseConfigureTableCellRowProtocol] = []
    let viewModel = AddNewDogViewModel()
    
    
    // TODO: вопрос 3 по выбору породы
    var dogName: String?
    
    private var currentPetType: PetType?
    
    
    var dogBreed = UILabel()
    var dogButton = UIButton()
    var catButton = UIButton()
    var dogOrCatLabel = UILabel()
    var dogImage = UIImageView()
    var catImage = UIImageView()
    var listOfBreedsButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    private func configureCell() {
        addSubviews()
        configureLayout()
    }
    override func configure(item: BaseConfigureCollectionCellRowProtocol) {
        dogBreed.customBlackText(nameFont: "SFProText-Semibold", sizeFont: 20, text: "Какая порода у вашего питомца?", letter: 0.38)
        dogBreed.font = UIFont.boldSystemFont(ofSize: CGFloat(20).adaptedFontSize)
        
        dogImage.image = UIImage(named: "animalDogIcon")
        dogImage.contentMode = .scaleAspectFit
        catImage.image = UIImage(named: "animalCatIcon")
        catImage.contentMode = .scaleAspectFit
        
        dogButton.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18)
        dogButton.layer.borderColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18).cgColor
        dogButton.layer.borderWidth = 1
        dogButton.layer.cornerRadius = 15
        dogButton.clipsToBounds = true
        dogButton.setAttributedTitle(NSAttributedString(string: "Собака", attributes: [NSMutableAttributedString.Key.kern: -0.41]), for: .normal)
        dogButton.setTitleColor(.black, for: .normal)
        dogButton.addTarget(self, action: #selector(dogButtonDidTap), for: .touchUpInside)
        dogButton.contentVerticalAlignment = .bottom
        dogButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        
        catButton.layer.borderColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18).cgColor
        catButton.layer.borderWidth = 1
        catButton.layer.cornerRadius = 15
        catButton.clipsToBounds = true
        catButton.setAttributedTitle(NSAttributedString(string: "Кот", attributes: [NSMutableAttributedString.Key.kern: -0.41]), for: .normal)
        catButton.setTitleColor(.black, for: .normal)
        catButton.addTarget(self, action: #selector(catButtonDidTap), for: .touchUpInside)
        catButton.contentVerticalAlignment = .bottom
        catButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        
        listOfBreedsButton.setTitle("Список пород", for: .normal)
        listOfBreedsButton.setTitleColor(.black, for: .normal)
        listOfBreedsButton.backgroundColor = .white
        listOfBreedsButton.addTarget(self, action: #selector(listOfBreeds), for: .touchUpInside)
        listOfBreedsButton.layer.cornerRadius = 10
        listOfBreedsButton.setTitleColor(UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6), for: .normal)
        listOfBreedsButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        listOfBreedsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
       
        
        
        if let item = item as? BreedsDogCollectionViewCellItem {
            self.item = item
            self.item?.updateDogBreedComplition = { breed in
                self.listOfBreedsButton.setTitle("\(breed)", for: .normal)
                self.listOfBreedsButton.setTitleColor(UIColor(red: 0.574, green: 0.407, blue: 1, alpha: 1), for: .normal)
                print("\(breed) пришла")
            }
        }
    }
   
    func addSubviews() {
        dogBreed.removeFromSuperview()
        contentView.addSubview(dogButton)
        dogButton.addSubview(dogImage)
        contentView.addSubview(catButton)
        catButton.addSubview(catImage)
        contentView.addSubview(dogBreed)
        contentView.addSubview(listOfBreedsButton)
        
    }
    func configureLayout() {
        dogBreed.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24.VAdapted)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        dogButton.snp.makeConstraints { make in
            make.top.equalTo(dogBreed.snp.bottom).offset(32.VAdapted)
            make.left.equalTo(contentView.snp.left).offset(63.HAdapted)
            make.size.equalTo([120, 152].HResized)
            make.right.equalTo(catButton.snp.left).offset(-24.HAdapted)
            make.bottom.equalTo(listOfBreedsButton.snp.top).offset(-32.VAdapted)
        }
        catButton.snp.makeConstraints { make in
            make.top.equalTo(dogBreed.snp.bottom).offset(32.VAdapted)
            make.right.equalTo(contentView.snp.right).offset(-63.HAdapted)
            make.size.equalTo([120, 152].HResized)
            make.bottom.equalTo(listOfBreedsButton.snp.top).offset(-32.VAdapted)
        }
        dogImage.snp.makeConstraints { make in
            make.top.equalTo(dogButton.snp.top).offset(20.VAdapted)
            make.left.equalTo(dogButton.snp.left).offset(20.VAdapted)
            make.right.equalTo(dogButton.snp.right).offset(-20.VAdapted)
            make.bottom.equalTo(dogButton.snp.bottom).offset(-52.VAdapted)
            
        }
        catImage.snp.makeConstraints { make in
            make.top.equalTo(catButton.snp.top).offset(20.VAdapted)
            make.left.equalTo(catButton.snp.left).offset(20.VAdapted)
            make.right.equalTo(catButton.snp.right).offset(-20.VAdapted)
            make.bottom.equalTo(catButton.snp.bottom).offset(-52.VAdapted)
            
        }
        listOfBreedsButton.snp.makeConstraints { make in
            make.size.equalTo([280, 44].HResized)
            make.left.equalTo(contentView.snp.left).offset(55.HAdapted)
            make.right.equalTo(contentView.snp.right).offset(-55.HAdapted)
            make.bottom.equalTo(contentView.snp.bottom).offset(-32.VAdapted)
        }
    }
    @objc func dogButtonDidTap() {
        currentPetType = .dog
        
        if dogButton.isSelected == true {
            dogButton.backgroundColor = .clear
            dogButton.isSelected = false
            
        } else if !dogButton.isSelected == true {
            dogButton.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18)
            dogOrCatLabel.text = "Собака"
            self.item?.changeDogOrCat?(dogOrCatLabel.text ?? "")
            catButton.backgroundColor = .clear
            catButton.isSelected = false
            dogButton.isSelected = true
        }
        
        
    }
    @objc func catButtonDidTap() {
        currentPetType = .cat
        
        if catButton.isSelected == true {
            catButton.backgroundColor = .clear
            catButton.isSelected = false
            
        } else if !catButton.isSelected == true {
            catButton.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.18)
            dogOrCatLabel.text = "Кот"
            self.item?.changeDogOrCat?(dogOrCatLabel.text ?? "")
            dogButton.backgroundColor = .clear
            dogButton.isSelected = false
            catButton.isSelected = true
        }
        
        
    }
    @objc func listOfBreeds() {
        self.item?.openListOfBreeds?(currentPetType ?? .dog)
    }
    
}
