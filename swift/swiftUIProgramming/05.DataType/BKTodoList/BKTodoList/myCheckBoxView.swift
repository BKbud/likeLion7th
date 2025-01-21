//
//  myCheckBoxView.swift
//  BKTodoList
//
//  Created by 정보경 on 1/17/25.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            VStack(alignment: .leading, spacing: 0){
                HStack {
                    Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                        .imageScale(.large)
                        .foregroundStyle(.indigo)
                    
                    configuration.label
                        .foregroundColor(.black)
                }
                .padding(5)
            }
        })
    }
    
}
