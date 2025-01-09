//
//  ContentView.swift
//  HelloWorld
//
//  Created by 정보경 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Text1")
            Text("Text2")
            Text("Text3")
            HStack {
                Text("Text4")
                Text("Text5")
            }
            Text("Text6")
            Text("Hello") + Text(", ") + Text("World!")
        }
    }
}

#Preview {
    ContentView()
}

