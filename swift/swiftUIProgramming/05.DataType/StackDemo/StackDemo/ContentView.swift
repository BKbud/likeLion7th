//
//  ContentView.swift
//  StackDemo
//
//  Created by 정보경 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.green)
                .frame(width: 120, height: 50)
            Rectangle()
                .fill(Color.red)
                //뷰의 위치 값을 게산하여 넘겨준다.
                .alignmentGuide(.leading, computeValue: {
                    dimensions in dimensions.width / 3
                })
                .frame(width: 200, height: 50)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 180, height: 50)
        }
    }
}

#Preview {
    ContentView()
}
