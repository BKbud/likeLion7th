//
//  TodoTableViewControllerDelegate.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

protocol TodoTableViewControllerDelegate: AnyObject {
    func loadTodoItems()
    func saveTodoItem(_ item: TodoItem)
    func editTodoItem(_ item: TodoItem)
    func deleteTodoItem(_ item: TodoItem)
}
