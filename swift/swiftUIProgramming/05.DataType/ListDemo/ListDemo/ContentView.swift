//
//  ContentView.swift
//  ListDemo
//
//  Created by 정보경 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            HStack {
                Image(systemName: "trash.circle.fill")
                Text("Take out the trash")
            }
            HStack {
                Image(systemName: "person.2.fill")
                Text("Pick up the kids")
            }
            HStack {
                Image(systemName: "car.fill")
                Text("Wash the car")
            }
        }
        List {
            Text("Wash the car")
                .listRowSeparator(.hidden)
            Text("Pick up kids from school bus @ 3pm")
                .listRowSeparatorTint(.green)
            Text("Auction the kids on eBay")
                .listRowSeparatorTint(.red)
            Text("Order Pizza for dinner")
                .listRowBackground(Image("images"))
        }
    }
}

#Preview {
    ContentView()
}
