//
//  ViewController.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController, TodoTableViewControllerDelegate {

    private var items: [TodoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        setupNavigationBar()
        loadTodoItems()
    }

    func setupNavigationBar() {
        self.navigationItem.title = "Todo List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    }

    @objc func didTapAddButton() {
        let vc = AddTodoController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // 섹션당 행 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // 테이블뷰 셀 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let item = items[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        let vc = DetailViewController()
        vc.item = item
        vc.delegate = self
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 스와이프 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        let item = items[indexPath.row]
        deleteTodoItem(item)
      }
    }
    
    func loadTodoItems() {
        items = CoreDataManager.shared.loadTodoItems()
        tableView.reloadData()
    }

    func saveTodoItem(_ item: TodoItem) {
        CoreDataManager.shared.saveTodoItem(item)
        loadTodoItems()
    }
    
    func editTodoItem(_ item: TodoItem) {
        CoreDataManager.shared.editTodoItem(item)
        loadTodoItems()
    }
    
    func deleteTodoItem(_ item: TodoItem) {
        CoreDataManager.shared.deleteTodoItem(item)
        loadTodoItems()
    }
}
