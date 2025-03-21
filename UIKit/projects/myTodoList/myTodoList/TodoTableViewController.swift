//
//  ViewController.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController {
    
    private var items: [TodoItem] = [
        TodoItem(title: "test task1", content: "first task"),
        TodoItem(title: "test task2", content: "second task")] // Todo items
    
    // Set Coredata Persistent Container
    private var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    
    private var viewContext: NSManagedObjectContext {
      return persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Todo List"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    }
    
    @objc func didTapAddButton() {
        let vc = AddTodoController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupTableView() {
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
}

