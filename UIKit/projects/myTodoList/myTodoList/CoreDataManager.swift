//
//  CoreDataManager.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }
    
    func loadTodoItems() -> [TodoItem] {
        let fetchRequest: NSFetchRequest<TodoItemEntity> = TodoItemEntity.fetchRequest()
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result.compactMap { TodoItem.from($0) }
        } catch {
            print("데이터 로드 실패: \(error)")
            return []
        }
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveTodoItem(_ item: TodoItem) {
        let _ = item.toManagedObject(in: viewContext) // ??
        
        do {
            try viewContext.save()
        } catch {
            print("저장 실패: \(error)")
        }
    }
    
    func editTodoItem(_ item: TodoItem) {
        let fetchRequest: NSFetchRequest<TodoItemEntity> = TodoItemEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", item.id as CVarArg)
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            if let objectToEdit = result.first {
                objectToEdit.title = item.title
                objectToEdit.content = item.content
                try viewContext.save()
            }
        } catch {
            print("수정 실패: \(error)")
        }
    }
    
    func deleteTodoItem(_ item: TodoItem) {
        let fetchRequest: NSFetchRequest<TodoItemEntity> = TodoItemEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", item.id as CVarArg)
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            if let objectToDelete = result.first {
                viewContext.delete(objectToDelete)
                try viewContext.save()
            }
        } catch {
            print("삭제 실패: \(error)")
        }
    }
}
