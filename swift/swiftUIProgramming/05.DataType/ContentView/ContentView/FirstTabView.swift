//
//  FirstTabView.swift
//  ContentView
//
//  Created by 정보경 on 1/13/25.
//

import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
            .task(priority: .background) {
                print("task executed!!!")
                title = await changeTitle()
            }
    }
    
    func changeTitle() async -> String {
        do {
            try await Task.sleep(nanoseconds: 5_000_000_000)
        } catch {
            print("Error: \(error)")
            return "View One"
        }
        return "Async task completed"
    }
    
    
}

#Preview {
    FirstTabView()
}
