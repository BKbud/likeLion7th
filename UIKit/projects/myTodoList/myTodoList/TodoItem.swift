//
//  TodoItem.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

class TodoItem: Hashable {
    let id: UUID
    let title: String
    let content: String
    
    init(title: String, content: String) {
        self.id = UUID()
        self.title = title
        self.content = content
    }
    
    init(id: UUID, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.id == rhs.id
    }
}
