//
//  ViewController.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Todo List"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    }
    
    @objc func didTapAddButton() {
        let vc = AddTodoController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

