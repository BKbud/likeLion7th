//
//  AddTodoController.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

class AddTodoController: UIViewController {
    
    var delegate: TodoTableViewControllerDelegate?
        
    private let titleTextField = UITextField()
    private let contentTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Add Task"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTabCancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    private func setupUI() {
        titleTextField.placeholder = "Enter task title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentTextView)
        
        // UI 제약 조건
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            contentTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func didTabCancel() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapSave() {
        guard let title = titleTextField.text, !title.isEmpty,
              let content = contentTextView.text, !content.isEmpty else {
            // TODO: 알림창 구현
            return
        }
        
        let newItem = TodoItem(title: title, content: content)
        delegate?.saveTodoItem(newItem)
        
        self.navigationController?.popViewController(animated: true)
    }
}
