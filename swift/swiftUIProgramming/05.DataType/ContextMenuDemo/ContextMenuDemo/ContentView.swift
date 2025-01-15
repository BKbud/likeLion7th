//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by 정보경 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset: CGSize = .zero
    
    @State private var foregroundColor: Color = .accentColor
    @State private var backgroundColor: Color = .black
    
    @State var isChanged: Bool = false
    
    var body: some View {
        Circle()
            .fill(isChanged ? Color.black : Color.blue)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        withAnimation {
                            self.offset = gesture.translation
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            self.offset = .zero
                        }
                    }
            )
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
                    self.isChanged = false
                }, label: { Text("Normal Color")
                    Image(systemName: "paintbrush")
                })
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .accentColor
                    self.isChanged = true
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
