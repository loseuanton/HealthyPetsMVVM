//
//  EditReminderViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 23.10.22.
//

import UIKit
import SnapKit


class EditReminderViewController: UIViewController {
    
   

    
    // MARK: - Views
    var rootView = EditReminderView()
    let viewModel = EditReminderViewModel()
    // var items: [BaseConfigureCollectionCellRowProtocol] = []
    var reminder: Reminder = Reminder()
    let reminderService = ReminderService()
    var natificationCenter = NotificationCenter()
    
    
    
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
        rootView.textView.text = viewModel.editReminder?.comment
        rootView.datePicker.date = viewModel.editReminder?.time ?? Date()
        //rootView.completeButton.addTarget(self, action: #selector(openRepeatScreen), for: .touchUpInside)
        rootView.deleteReminderButton.addTarget(self, action: #selector(deleteReminder), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        let rightBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rightBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rightBarButton
        rootView.rightBarButton.addTarget(self, action: #selector(saveReminder), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [rootView.textView, rootView.dateView, rootView.completeButton, rootView.deleteReminderButton])
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
    
    
    
    @objc func closeScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func saveReminder() {
        natificationCenter.removeLocalNotificationCenter()
        viewModel.editReminderCopy?.comment = rootView.textView.text
        viewModel.editReminderCopy?.time = rootView.datePicker.date
        reminderService.saveEditReminder(reminder: viewModel.editReminderCopy!)
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    @objc func deleteReminder() {
        natificationCenter.removeLocalNotificationCenter()
        reminderService.removeReminder(reminder: viewModel.editReminder!)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    
}
extension EditReminderViewController: UITextViewDelegate {
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

