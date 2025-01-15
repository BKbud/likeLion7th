//
//  ContentView.swift
//  GridDemo
//
//  Created by 정보경 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridItems = [ GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible()) ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach((0...30), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .clipShape(.rect(cornerRadius: 10))
            .font(.largeTitle)
    }
}
