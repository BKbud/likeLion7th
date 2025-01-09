//
//  ContentView.swift
//  HelloWorld
//
//  Created by 정보경 on 1/8/25.
//

import SwiftUI

//struct ContentView: View {
//    //상태를 관리하는 프로퍼티
//    @State private var count = 0
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Count")
//                .font(.largeTitle)
//
//            Text("\(count)")
//                .font(.system(size: 100))
//                .fontWeight(.bold)
//                .foregroundColor(count % 2 == 0 ? .blue : .red)
//            HStack {
//                Button(action: {
//                    self.count -= 1
//                }, label: {
//                    Text("-")
//                        .font(.largeTitle)
//                        .padding()
//                        .background(Color.gray)
//                        .foregroundStyle(.white)
//                        .clipShape(Circle())
//                })
//                Spacer()
//
//                Button("RESET", action: {
//                    self.count = 0
//                })
//                .font(.largeTitle)
//                Spacer()
//
//                Button(action: {
//                    self.count += 1
//                }, label: {
//                    Text("+")
//                        .font(.largeTitle)
//                        .padding()
//                        .background(Color.green)
//                        .foregroundStyle(.white)
//                        .clipShape(Circle())
//                })
//            }
//        }
//        .padding(40)
//    }
//}


struct MyVStack<MyContent: View>: View {
    let content: () -> MyContent
    
    // @escaping: 현재 함수 범위를 넘어가도 실행될 수 있도록 하는 어노테이션
    // @ViewBuilder: 클로저 문법으로 받은 파라미터가 뷰라는 것을 명시적으로 표기하는 속성
    // 스위프트 클로저 형태를 취하며 여러 하위 뷰로 구성된 커스텀 뷰를 만드는 데 사용될 수 있다. 
    init(@ViewBuilder content: @escaping () -> MyContent) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.title)
    }
}

// 커스텀 레이블 스타일 (레이아웃)
struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.icon
                .padding(5)
            configuration.title
        }
    }
}

struct ContentView: View {
    var body: some View {
        MyVStack (content: {
            Text("Text1")
            Text("Text2")
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            Button(action:{
                print("click")
            })
            {
                Label("Welcome to SwiftUI",
                      systemImage: "person.circle.fill")
            }
            Label(
                title: {
                    Text("Welcome to SwiftUI")
                        .font(.largeTitle)
                }, icon: {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                }
            )
            .labelStyle(.titleAndIcon)
            Label("수직 레이블", systemImage: "moon.fill")
                .labelStyle(VerticalLabelStyle())
        })
    }
}

#Preview {
    ContentView()
}

