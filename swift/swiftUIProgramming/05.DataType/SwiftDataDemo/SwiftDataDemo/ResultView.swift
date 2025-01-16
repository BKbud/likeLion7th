//
//  ResultView.swift
//  SwiftDataDemo
//
//  Created by 정보경 on 1/16/25.
//

import Foundation

// FetchDescriptor
// #: 매크로. #Predicate<Product> -> Product 타입의 .. 를 클로저로 변환해서 전달하는 매크로
import SwiftUI
import SwiftData

struct ResultsView: View {
    var name: String
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var matches: [Product] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(matches) { product in
                    HStack {
                        Text(product.name ?? "Not found")
                        Spacer()
                        Text(product.quantity ?? "Not found")
                    }
                }
            }
            .navigationTitle("Results")
        }
        .task {
            let descriptor = FetchDescriptor<Product>(predicate: #Predicate<Product> { $0.name == name })
            do {
                matches = try modelContext.fetch(descriptor)
            } catch {
                print("Error fetching products: \(error)")
                matches = []
            }
        }
    }
}

#Preview {
    ResultsView(name: "test")
        .modelContainer(for: Product.self, inMemory: true)
}
