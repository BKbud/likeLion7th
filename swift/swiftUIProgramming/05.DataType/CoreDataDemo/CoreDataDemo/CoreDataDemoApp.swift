//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by 정보경 on 1/16/25.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
            // 첫 번째 인자는 위치(경로) 키패스, 두 번째 인자는 주입할 컨텍스트)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

// @Environment -> 상위 하위 뷰 여러개 있는데 상위뷰에서 만든 데이터(뷰)를 하위뷰에 같이 공유하고 싶을 때 (참조하게해줌), 하위 뷰의 환경 변수에 상위 뷰의 데이터를 주입하는 것.
