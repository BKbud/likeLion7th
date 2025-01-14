//
//  ContentView.swift
//  ListDemo
//
//  Created by 정보경 on 1/14/25.
//

import SwiftUI

struct ToDoItem: Identifiable, Hashable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ContentView: View {
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    @State private var toggleStatus = true
    
    var body: some View {
        
        NavigationStack {
            List {
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow notifications")
                    }
                    NavigationLink(value: listData.count) {
                        Text("View Task Count")
                    }
                }
                Section(header: Text("To Do Task")) {
                    ForEach (listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                }
            }
            // 네비바 타이틀 지정
            .navigationTitle(Text("To Do List"))
            //            .navigationBarItems(trailing: Button("ADD", action: {}))
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction,
                            content: { Button("Add", action: {})})
            })
            .navigationDestination(for: ToDoItem.self) { item in
                Text("My task = \(item.task)")
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks = \(count)")
            }
            .navigationDestination(for: String.self) { task in
                Text("Selected task = \(task)")
            }
        }
        .refreshable {
            listData = [
                ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Order lunch", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Order breakfast", imageName: "dollarsign.circle.fill"),
            ]
        }
    }
}

#Preview {
    ContentView()
}
