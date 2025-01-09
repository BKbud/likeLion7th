//
//  ContentView.swift
//  HelloWorld
//
//  Created by 정보경 on 1/8/25.
//

import SwiftUI

//------------counter app--------------
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
// ios 15 이후로는 safearea가 전체적으로 채워지는게 기본으로 변경되었다.
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

// ---------------custom label--------------------
//// View 프로토콜을 따르는 Generic type 'MyContent'
//struct MyVStack<MyContent: View>: View {
//    let content: () -> MyContent
//
//    // @escaping: 현재 함수 범위를 넘어가도 실행될 수 있도록 하는 어노테이션
//    // @ViewBuilder: 클로저 문법으로 받은 파라미터가 뷰라는 것을 명시적으로 표기하는 속성
//    // 스위프트 클로저 형태를 취하며 여러 하위 뷰로 구성된 커스텀 뷰를 만드는 데 사용될 수 있다.
//    init(@ViewBuilder content: @escaping () -> MyContent) {
//        self.content = content
//    }
//
//    var body: some View {
//        VStack(spacing: 10) {
//            content()
//        }
//        .font(.title)
//    }
//}
//
//// 커스텀 레이블 스타일 (레이아웃)
//struct VerticalLabelStyle: LabelStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        VStack(alignment: .center) {
//            configuration.icon
//                .padding(5)
//            configuration.title
//        }
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        MyVStack (content: {
//            Text("Text1")
//            Text("Text2")
//            HStack {
//                Image(systemName: "star.fill")
//                Image(systemName: "star.fill")
//                Image(systemName: "star")
//            }
//            Button(action:{
//                print("click")
//            }) {
//                Label("Welcome to SwiftUI",
//                      systemImage: "person.circle.fill")
//            }
//            Label(
//                title: {
//                    Text("Welcome to SwiftUI")
//                        .font(.largeTitle)
//                }, icon: {
//                    Circle()
//                        .fill(Color.blue)
//                        .frame(width: 25, height: 25)
//                }
//            )
//            .labelStyle(.titleAndIcon)
//            Label("수직 레이블", systemImage: "moon.fill")
//                .labelStyle(VerticalLabelStyle())
//        })
//    }
//}

//-------------duplicated label------------
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: "goforward.10")
//                Image(systemName: "goforward.15")
//                Image(systemName: "goforward.30")
//            }
//            ZStack {
//                Image(systemName: "goforward.10")
//                Image(systemName: "goforward.15")
//                Image(systemName: "goforward.30")
//            }
//            // 복잡한 중첩 레이아웃 예시
//            Text("Financial Results")
//                .font(.title)
//            HStack {
//                Text("Q1 Sales")
//                    .font(.headline)
//                VStack {
//                    Text("January")
//                    Text("February")
//                    Text("March")
//                }
//                VStack {
//                    Text("$1000")
//                    Text("$200")
//                    Text("$3000")
//                }
//            }
//            // 정렬, 여백
//            HStack(alignment: .top) {
//                Text("Q1 Sales")
//                    .font(.headline)
//                Spacer()
//                VStack(alignment: .leading) {
//                    Text("January")
//                    Text("February")
//                    Text("March")
//                }
//                Spacer()
//                VStack(alignment: .leading) {
//                    Text("$1000")
//                    Text("$200")
//                    Text("$3000")
//                }
//            }
//        }
//    }
//    
//}

//----------------동적 Stack------------
//struct ContentView: View {
//    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
//    
//    var body: some View {
//        myLayout {
//            Text("Sample Text")
//            Text("Sample Text")
//            Text("Sample Text")
//        }
//        HStack {
//            Button(action: {
//                myLayout = AnyLayout(HStackLayout())
//            }) {
//                Text("HStack")
//            }
//            Button(action: {
//                myLayout = AnyLayout(VStackLayout())
//            }) {
//                Text("VStack")
//            }
//        }
//        
//        HStack {
//            Image(systemName: "airplane")
//            Text("Flight times:")
//                .layoutPriority(1) // 우선순위 부여
//            Text("London")
//        }
//        .font(.largeTitle)
//        .lineLimit(1) // 글씨 크기로 인해 줄 바뀜을 제한
//    }
//}

// -----------------Frame------------------
//struct ContentView: View {
//    var body: some View {
//        Text("Hello World")
//            .font(.largeTitle)
//            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//            .border(Color.black)
//            .background(Color.cyan)
////            .ignoresSafeArea(.all)
//    }
//}
//--------------GeometrReader------------


//-------------state---------
struct ContentView: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Toggle("Enable Wi-Fi", isOn: $wifiEnabled)
            TextField("Enter user name", text: $userName)
            WifiImageView(wifiEnabled: $wifiEnabled)
            Text(userName)
        }
    }
}

struct WifiImageView: View {
    @Binding var wifiEnabled : Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

#Preview {
    ContentView()
}
