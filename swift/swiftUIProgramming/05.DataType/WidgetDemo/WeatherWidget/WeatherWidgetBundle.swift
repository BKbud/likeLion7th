//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by 정보경 on 1/23/25.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetControl()
        WeatherWidgetLiveActivity()
    }
}
