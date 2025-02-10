//
//  ContentView.swift
//  Practice
//
//  Created by 정보경 on 1/27/25.
//

import SwiftUI

struct City: Identifiable {
    var id: Int
    var name: String
}

struct ContentView: View {
    @State private var cities: [City] = [City(id: 1, name: "aa"),
                                         City(id: 2, name: "bb"),
                                         City(id: 3, name: "cc")]

    var body: some View {
        TabView {
            ForEach(cities) { city in
                Text(city.name)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
