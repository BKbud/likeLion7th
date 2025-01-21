//
//  ContentView.swift
//  BKTodoList
//
//  Created by 정보경 on 1/17/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // coredata 영구 저장소를 사용하기 위해 데이터를 다룰 수 있는 (객체관리)컨텍스트를 가져옵니다. ex.포스기 어플을 킨다
    // 이제 이 컨텍스트를 사용해서 영구 저장소의 데이터를 수정, 삭제, 저장할 수 있습니다.
    @Environment(\.managedObjectContext) private var viewContext
    
    // 데이터 조회: 영구 저장소의 데이터를 불러옵니다. 아래 코드는 Item 엔티티에 대한 데이터를 가져옵니다.
    // sortDescriptors에서는 데이터 정렬 기준을 정의합니다.
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.createdAt, ascending: true)])
    private var items: FetchedResults<Item>
    
    @State private var searchQuery = ""
    
    var body: some View {
        
        VStack {
            Text("To Do List")
                .font(.system(size: 25))
                .foregroundStyle(Color.indigo)
                .bold()
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(Color.indigo)
                TextField("Search by contents", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
            }
            .padding()
            List {
                ForEach(items) { item in
                    ListCellView(item: item) {
                        saveContext()
                    }
                }
                .onDelete(perform: deleteItems) // 아이템 삭제 기능
                
                Button(action: addItem) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.indigo)
                        
                }
                .padding(8)
            }
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    // 아이템을 추가할 때 왜 순서가 중구난방이지?
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext) // 새로운 아이템 생성
            newItem.contents = "" // 값 초기화
            newItem.isOn = false
            newItem.createdAt = Date()
            
            saveContext()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                offset in
                items[offset]
            }.forEach({
                element in
                viewContext.delete(element)
            })
            
            saveContext()
        }
    }
    
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
