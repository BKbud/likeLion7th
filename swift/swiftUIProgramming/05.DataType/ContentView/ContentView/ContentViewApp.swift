//
//  ContentViewApp.swift
//  ContentView
//
//  Created by 정보경 on 1/13/25.
//

import SwiftUI

@main
struct ContentViewApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView.init()
        }
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .active:
                print("Active")
            case .inactive:
                print("Inactive")
            case .background:
                print("Background")
            default:
                print("Unkonwn scenephase")
            }
        }
    }
}
