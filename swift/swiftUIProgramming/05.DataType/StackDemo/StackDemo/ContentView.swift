//
//  ContentView.swift
//  StackDemo
//
//  Created by 정보경 on 1/14/25.
//

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.top]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .crossAlignment, spacing: 20) {
            Rectangle()
                .fill(Color.green)
                .frame(width: 40, height: 100)
            Rectangle()
                .fill(Color.red)
                .frame(width: 40, height: 100)
            Rectangle()
                .fill(Color.blue)
                .alignmentGuide(.crossAlignment, computeValue: { d in
                    d[VerticalAlignment.center]
                })
                .frame(width: 40, height: 100)
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 40, height: 100)
            
        }
    }
}

#Preview {
    ContentView()
}
