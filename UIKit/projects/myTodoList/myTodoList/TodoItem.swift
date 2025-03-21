//
//  TodoItem.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit
import CoreData

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

extension TodoItem {
  // TodoItem -> TodoItemEntity 변환
  func toManagedObject(in context: NSManagedObjectContext) -> TodoItemEntity {
    let entity = TodoItemEntity(context: context)
    entity.id = id
    entity.title = title
    entity.content = content
    entity.createdAt = Date()
    return entity
  }

  // TodoItemEntity -> TodoItem 변환
  static func from(_ entity: TodoItemEntity) -> TodoItem? {
    guard let id = entity.id,
          let title = entity.title,
          let content = entity.content else {
      return nil
    }

      let item = TodoItem(id: id, title: title, content: content)
    return item
  }

}
