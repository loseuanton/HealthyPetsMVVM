//
//  ReminderViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 18.08.22.
//

import UIKit
import SnapKit

class ReminderViewController: UIViewController {
    var openRepeatsScreen: (() -> Void)?
    
    
    // MARK: - Views
    var rootView = ReminderView()
    let viewModel = ReminderViewModel()
    // var items: [BaseConfigureCollectionCellRowProtocol] = []
    
    
    
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
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rootView.backgroundView.gradient()
    }
    
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        rootView.repeatButton.addTarget(self, action: #selector(openRepeatScreen), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [rootView.textView, rootView.dateView, rootView.repeatButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        rootView.textView.delegate = self
        rootView.backgroundView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(rootView.commentLabel.snp.bottom).offset(4)
            make.leading.equalTo(rootView.backgroundView.snp.leading).offset(16.HAdapted)
            make.trailing.equalTo(rootView.backgroundView.snp.trailing).offset(-16.HAdapted)
        }
        
        
        
    }
    @objc func openRepeatScreen() {
        openRepeatsScreen?()
    }
    
    @objc func closeScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
}
extension ReminderViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Добавьте описание, например, таблетка от клещей"
            textView.textColor = UIColor.lightGray
        }
    }
}
