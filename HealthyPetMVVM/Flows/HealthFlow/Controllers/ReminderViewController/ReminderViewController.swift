//
//  ReminderViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 18.08.22.
//

import UIKit
import SnapKit
import UserNotifications

class ReminderViewController: UIViewController, UIGestureRecognizerDelegate {
    var openRepeatsScreen: (() -> Void)?
    var natificationCenter = NotificationCenter()

    
    // MARK: - Views
    var rootView = ReminderView()
    let viewModel = ReminderViewModel()
    // var items: [BaseConfigureCollectionCellRowProtocol] = []
    var reminder: Reminder = Reminder()
    let reminderService = ReminderService()
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        natificationCenter.notification()
        
        
        
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
        let rightBarButton = UIBarButtonItem(customView: rootView.rightBarButton)
        rightBarButton.tintColor = .clear
        self.navigationItem.rightBarButtonItem = rightBarButton
        rootView.rightBarButton.addTarget(self, action: #selector(saveReminder), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [rootView.textView, rootView.dateView, rootView.repeatButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        rootView.textView.delegate = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        rootView.backgroundView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(rootView.commentLabel.snp.bottom).offset(4)
            make.leading.equalTo(rootView.backgroundView.snp.leading).offset(16.HAdapted)
            make.trailing.equalTo(rootView.backgroundView.snp.trailing).offset(-16.HAdapted)
        }
        
        
        
    }
    func updateRepeatText(text: String) {
        rootView.repeatTextLabel.text = text
    }
    @objc func openRepeatScreen() {
        openRepeatsScreen?()
    }
    
    @objc func closeScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func saveReminder() {
        reminder.comment = rootView.textView.text
        reminder.time = rootView.datePicker.date
        let data = NSData(data: (rootView.imageReminder.image?.jpegData(compressionQuality: 0.9))!)
        
        reminder.reminderIcon = data as Data
        //reminder.action = navigationItem.title ?? "Прививки"
        reminder.action = rootView.titleLabel.text ?? "Прививки"
        reminderService.saveReminder(reminder: reminder)
        self.navigationController?.popToRootViewController(animated: true)
        print(reminder.time)
        print(reminder)
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rootView.textView.endEditing(true)
    }
}
