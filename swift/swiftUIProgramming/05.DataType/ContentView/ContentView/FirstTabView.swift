//
//  FirstTabView.swift
//  ContentView
//
//  Created by 정보경 on 1/13/25.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("View One")
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
    }
}

#Preview {
    FirstTabView()
}
