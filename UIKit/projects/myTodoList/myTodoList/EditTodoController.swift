//
//  EditTodoController.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

class EditTodoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Detail"
    }
    
}
