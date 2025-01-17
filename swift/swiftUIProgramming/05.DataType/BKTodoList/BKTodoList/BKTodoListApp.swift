//
//  BKTodoListApp.swift
//  BKTodoList
//
//  Created by 정보경 on 1/17/25.
//

import SwiftUI

@main
struct BKTodoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
