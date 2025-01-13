//
//  SecondTabView.swift
//  ContentView
//
//  Created by 정보경 on 1/13/25.
//

import SwiftUI

struct SecondTabView: View {
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
//        과거 버전
//        text 변수의 변경 시 실행되는 수정자
//            .onChange(of: text, perform: { value in
//                print("onChange triggered")
//            })
            .onChange(of: text, initial: false) {
                print("onChange triggered")
            }
    }
}

#Preview {
    SecondTabView()
}
