//
//  DescriptionHistoryReminderViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.11.22.
//

import UIKit
import SnapKit


class DescriptionHistoryReminderViewController: UIViewController, UIGestureRecognizerDelegate {
  
    // MARK: - Views
    var rootView = DescriptionHistoryReminderView()
    let viewModel = DescriptionHistoryReminderViewModel()
    let reminderService = ReminderService()
    let historyReminderService = HistoryReminderService()
   
    
    
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
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rootView.backgroundView.gradient()
    }
    // MARK: - Configure Views
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        navigationItem.title = viewModel.historyReminder?.action
        rootView.textView.text = viewModel.historyReminder?.comment
        if let reminderIcon = viewModel.historyReminder?.reminderIcon {
            self.rootView.healthIImage.image =  UIImage(data: reminderIcon as Data)
        }
        let dateForrmater = DateFormatter()
        dateForrmater.dateFormat = "HH:mm • dd MMMM yyyy г."
        let timeString = dateForrmater.string(from: viewModel.historyReminder?.time ?? Date())
        rootView.dateLabel.text = timeString
        rootView.deleteReminderButton.addTarget(self, action: #selector(deleteReminder), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: rootView.leftBarButton)
        leftBarButton.tintColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
        rootView.leftBarButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [rootView.textView, rootView.dateView, rootView.deleteReminderButton])
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
    
    
    // MARK: - Action Buttons
    @objc func closeScreen() {
        
       
        self.navigationController?.popViewController(animated: true)
    }
   
    @objc func deleteReminder() {
        
        if let historyReminder = viewModel.historyReminder {
            historyReminderService.removeHistoryReminder(historyReminder: historyReminder)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - Extension
extension DescriptionHistoryReminderViewController: UITextViewDelegate {
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
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
}


