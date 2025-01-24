//
//  ContentView.swift
//  MyTimerApp
//
//  Created by 정보경 on 1/24/25.
//

import SwiftUI
//import AVFoundation

struct ContentView: View {
    
    @State private var progress: Double = 0.0
    @State private var timeRemaining = 600.0
    @State private var isRunning = false
    @State private var startTime: Double = 0.0
    private let restTime = 600.0
    private let studyTime = 3000.0
    @State private var isStudying = false
    
    // 프로그램을 실행하면 기본적으로 돌고 있음. 화면이 갱신되지 않을 뿐임
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Button(action: {
                timeRemaining = isStudying ? restTime : studyTime
                isStudying.toggle()
                progress = 0
            }, label: {
                Text(isStudying ? "휴식시간으로 전환" : "수업시간으로 전환")
            })
            ProgressView(value: progress, total: 100.0)
                .progressViewStyle(LinearProgressViewStyle())
                .frame(width: 250, height: 10)
                .tint(Color.indigo)
                .padding()
            
            Text("\(String(format: "%02d", Int(timeRemaining) / 60)):\(String(format: "%02d", Int(timeRemaining) % 60))")
                .font(.system(size: 50, weight: .bold))
                .onTapGesture {
                    timeRemaining = isStudying ? studyTime : restTime
                }
            
            HStack {
                Button(action: {
                    if timeRemaining - 10 > 0 {
                        timeRemaining -= 10
                        progress = 100.0 - (timeRemaining / startTime) * 100
                    } else {
                        timeRemaining = 0
                        progress = 0
                    }
                }, label: {
                    Image(systemName: "10.arrow.trianglehead.counterclockwise")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(5)
                })
                Button(action: {
                    startTime = timeRemaining
                    isRunning.toggle()
                }) {
                    Image(systemName: isRunning ? "pause.fill" : "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding()
                }
                Button(action: {
                    isRunning = false
                    timeRemaining = isStudying ? studyTime : restTime
                    progress = 0.0
                }) {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding()
                }
                // 10초 앞으로 가기
                Button(action: {
                    timeRemaining += 10
                    // 진행 상태 업데이트
                    if timeRemaining > startTime {
                        startTime = timeRemaining
                        progress = 100 / startTime
                    } else {
                        progress = 100 - (timeRemaining / startTime) * 100
                    }
                }, label: {
                    Image(systemName: "10.arrow.trianglehead.clockwise")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(5)
                })
            }
        }
        .padding()
        .onReceive(timer) { _ in
            if isRunning && timeRemaining > 0 {
                timeRemaining -= 1
                if progress < 100 {
                    progress += 100 / startTime
                }
            } else if timeRemaining == 0 {
                // stop timer
                NSSound.beep()
                isRunning = false
            } else {
                // ignore
            }
        }
        .onAppear {
            // 앱이 시작될 때 첫 번째 창을 항상 위로 설정
            if let window = NSApplication.shared.windows.first {
                window.level = .floating
            }
        }
        .background(isStudying ? Color.black : Color.cyan.opacity(0.4))
    }
}

#Preview {
    ContentView()
}
