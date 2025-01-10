//
//  ContentView.swift
//  OXQuiz
//
//  Created by 정보경 on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 4
    @State var number2: Int = 2
    @State var resultNumber: Int = 9
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        VStack(spacing: 60) {
            // UI 구성 및 로직 작성 부분
            Text("다음 수식은 맞을까요?")
                .font(.largeTitle)
            Spacer()
            Text("\(number1) X \(number2) = \(resultNumber)")
                .font(.largeTitle)
            HStack {
                Button(action: {
                    number1 * number2 == resultNumber ? selectCorrect() : selectWrong()
                }, label: {
                    Text("맞음").padding()
                        .font(.largeTitle)
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                })
                Spacer()
                Button(action: {
                    number1 * number2 != resultNumber ? selectCorrect() : selectWrong()
                }, label: {
                    Text("틀림").padding()
                        .font(.largeTitle)
                        .background(Color.red)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                })
            }
            Spacer()
            
            HStack {
                Text("\(countCorrect)맞춤")
                    .padding()
                    .font(.largeTitle)
                    .frame(width: 150)
                
                Text("\(countWrong)틀림")
                    .padding()
                    .font(.largeTitle)
                    .frame(width: 150)
            }
            Spacer()
            
            Button(action: {
                reloadGame()
            }) {
                Text("카운트 초기화")
            }
            .font(.largeTitle)
            .foregroundStyle(.blue)
        }.padding()
    }
    func reloadGame() {
        // 게임 재시작 로직
        countCorrect = 0
        countWrong = 0
    }
    func selectCorrect() {
        // 정답 선택 시 로직
        countCorrect += 1
        // 랜덤 값을 생성해서 넣어주는 로직
    }
    func selectWrong() {
        // 오답 선택 시 로직
        countWrong += 1
    }
}

#Preview {
    ContentView()
}
