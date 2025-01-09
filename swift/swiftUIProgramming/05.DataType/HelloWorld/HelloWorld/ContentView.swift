//
//  ContentView.swift
//  HelloWorld
//
//  Created by 정보경 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    //상태를 관리하는 프로퍼티
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count")
                .font(.largeTitle)
            
            Text("\(count)")
                .font(.system(size: 100))
                .fontWeight(.bold)
                .foregroundColor(count % 2 == 0 ? .blue : .red)
            HStack {
                Button(action: {
                    self.count -= 1
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.gray)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                })
                Spacer()
                
                Button("RESET", action: {
                    self.count = 0
                })
                .font(.largeTitle)
                Spacer()
                
                Button(action: {
                    self.count += 1
                }, label: {
                    Text("+")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                })
            }
        }
        .padding(40)
    }
}

#Preview {
    ContentView()
}

