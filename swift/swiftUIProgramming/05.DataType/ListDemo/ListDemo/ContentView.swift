//
//  ContentView.swift
//  ListDemo
//
//  Created by 정보경 on 1/14/25.
//

struct ToDoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

import SwiftUI

struct ContentView: View {
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    @State private var toggleStatus = true
    
    var body: some View {
        
        List {
            Section(header: Text("Settings")) {
                Toggle(isOn: $toggleStatus) {
                    Text("Allow notifications")
                }
            }
            Section(header: Text("To Do Task")) {
                ForEach (listData) { item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
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
