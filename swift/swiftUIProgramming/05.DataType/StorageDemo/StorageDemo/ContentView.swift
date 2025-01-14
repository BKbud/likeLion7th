//
//  ContentView.swift
//  StorageDemo
//
//  Created by 정보경 on 1/13/25.
//

/**
 * 앱을 다시 시작해도 유지되어야 하는 소량의 데이터를 앱이 저장하고 있어야 한다.
 * swift는 소량의 앱 데이터를 지속적으로 저장하기 위한 특별한 목적을 위해 두 개의 프로퍼티 래퍼(@AppStorage, @SceneStorage)를 제공한다.
 */

import SwiftUI

struct ContentView: View {
    
    // 화면 저장소는 관련된 값을 저장하기 위해 내부적으로 사용되는 키 문자열과 함께 @SceneStorage 프로퍼티 래퍼를 사용하여 선언된다.
    // 'city'라는 키를 사용하여 String 값을 저장하게 설계된 scene storage이다.
    // scene 관련된 데이터를 저장하고 관리하는데 사용
    
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    ContentView()
}
