//
//  WeatherDetailView.swift
//  WidgetDemo
//
//  Created by 정보경 on 1/23/25.
//

import SwiftUI

struct WeatherDetailView: View {
    
    var weather: WeatherType
    
    var body: some View {
        VStack {
            Image(systemName: weather.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 150.0, height: 150.0)
            Text(weather.name)
                .padding()
                .font(.title)
            Text("If this were a real weather app, a description of \(weather.name) would appear here.")
                .padding()
            Spacer()
        }
    }
}

#Preview {
    let weather = WeatherType(name: "Thunder Storms", icon: "cloud.bolt")
    WeatherDetailView(weather: weather)
}
