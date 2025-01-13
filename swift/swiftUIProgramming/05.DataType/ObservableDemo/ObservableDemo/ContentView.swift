//
//  ContentView.swift
//  ObservableDemo
//
//  Created by 정보경 on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    
    //Observable 지정 객체는 @State로 상태 관리가 가능해짐. 2024 이후
    @State var timerData: TimerData = TimerData()
    
    var body: some View {
        // NavigationView -> NavigationView 이름 변경
        NavigationStack {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                
                NavigationLink("Next Scene", destination: {
                    SecondView()
                })
                .padding()
            }
        }
        .environment(timerData)
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

#Preview {
    ContentView()
}

