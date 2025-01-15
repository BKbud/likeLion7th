//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by 정보경 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var foregroundColor: Color = .accentColor
    @State private var backgroundColor: Color = .black
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .contextMenu {
                Button(action: {
                    self.foregroundColor = .accentColor
                    self.backgroundColor = .black
                }, label: { Text("Normal Color")
                    Image(systemName: "paintbrush")
                })
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .accentColor
                }, label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                })
            }
    }
}

#Preview {
    ContentView()
}
