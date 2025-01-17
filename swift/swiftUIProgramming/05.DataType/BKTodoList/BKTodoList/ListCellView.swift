//
//  ListCellView.swift
//  BKTodoList
//
//  Created by 정보경 on 1/17/25.
//

import SwiftUI

struct ListCellView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject private var item: Item
    
    @State private var contents: String
    @State private var isOn: Bool = false
    
    // saveChanges를 클로저로 받아옵니다.
    var saveContext: () -> Void
    
    init(item: Item, saveContext: @escaping () -> ()) {
        self.item = item
        self.contents = item.contents ?? ""
        self.isOn = item.isOn
        self.saveContext = saveContext
    }
    
    var body: some View {
        HStack {
            Toggle("", isOn: $isOn)
                .onChange(of: isOn, { oldValue, newValue in
                    item.isOn = newValue
                    saveContext()
                })
                .toggleStyle(CheckboxToggleStyle())
            TextField("Enter your task...", text: $contents)
                .onChange(of: contents) { oldValue, newValue in
                    item.contents = contents
                    saveContext()
                }
        }
        .padding()
    }
}

//#Preview {
//    ListCellView()
//}
