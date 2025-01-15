//
//  ContentView.swift
//  ChartDemo
//
//  Created by 정보경 on 1/15/25.
//

import SwiftUI
//그래프, 통계 등을 다루는 경우는 Charts 라이브러리를 이용해야함.
import Charts

struct MonthlyTemp: Identifiable {
    var id = UUID()
    var month: String
    var degrees: Int
}

let tempData: [MonthlyTemp] = [
    MonthlyTemp(month: "Jan", degrees: 50),
    MonthlyTemp(month: "Feb", degrees: 43),
    MonthlyTemp(month: "Mar", degrees: 61),
    MonthlyTemp(month: "Apr", degrees: 33)
]

struct ContentView: View {
    var body: some View {
        // 배열을 넘겨주어 모든 데이터를 간단하게 다룰 수 있다.
        Chart(tempData) { data in
            AreaMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degrees)
            )
        }
    }
}

#Preview {
    ContentView()
}
