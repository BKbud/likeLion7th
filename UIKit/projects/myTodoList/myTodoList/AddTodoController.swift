//
//  AddTodoController.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

class AddTodoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
    }

    func setupNavigationBar() {
        self.navigationItem.title = "Add Task"
    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTabCancel))
    }
    
    @objc func didTabCancel() {
        self.navigationController?.popViewController(animated: true)
    }
}
