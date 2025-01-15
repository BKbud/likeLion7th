//
//  ContentView.swift
//  GridDemo
//
//  Created by 정보경 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    CellContent(index: index, color: .red)
                }
            }
            GridRow {
                ForEach(6...10, id: \.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }
            GridRow {
                ForEach(11...15, id: \.self) { index in
                    CellContent(index: index, color: .green)
                }
            }
            CellContent(index: 16, color: .blue)
            
            GridRow {
                CellContent(index: 17, color: .orange)
                    .gridCellColumns(2)
                CellContent(index: 18, color: .purple)
                    .gridCellColumns(3)
            }
        }
        .padding()
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
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .clipShape(.rect(cornerRadius: 10))
            .font(.largeTitle)
    }
}
