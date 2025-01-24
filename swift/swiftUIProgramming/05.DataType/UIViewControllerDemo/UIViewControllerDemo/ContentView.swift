//
//  ContentView.swift
//  UIViewControllerDemo
//
//  Created by 정보경 on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    
    // imagePickerVisible은 이미지 피커가 화면에 표시될지 여부를 나타내는 상태 변수입니다.
    @State var imagePickerVisible: Bool = false
    
    // selectedImage는 사용자가 선택한 이미지를 저장하는 상태 변수입니다.
    @State var selectedImage: Image? = Image(systemName: "photo") // 기본적으로 시스템의 'photo' 아이콘을 표시합니다.
    
    var body: some View {
        VStack {
            // 선택된 이미지가 있다면 이를 표시합니다. (resizable과 aspectRatio로 크기 조정)
            // 만약 이미지가 없다면 기본 'photo' 아이콘이 표시됩니다.
            selectedImage?
                .resizable()  // 이미지를 크기 조정 가능하게 만듭니다.
                .aspectRatio(contentMode: .fit)  // 이미지 비율을 유지하며 크기를 맞춥니다.
            
            // 'Select an Image' 버튼을 눌렀을 때 이미지 선택 화면을 보여주는 액션
            Button(action: {
                withAnimation {
                    // 이미지 피커 화면의 표시 여부를 토글합니다.
                    self.imagePickerVisible.toggle()
                }
            }, label: {
                Text("Select an Image")  // 버튼 텍스트
            })
        }
        .padding()  // VStack에 여백을 추가하여 UI가 더 깔끔하게 보이도록 합니다.
        // .sheet는 SwiftUI의 모달(하단에서 올라오는 팝업 형태)로 화면을 표시할 때 사용합니다.
        .sheet(isPresented: $imagePickerVisible) {
            // 이미지 피커를 표시하는 뷰를 넣습니다.
            MyImagePicker(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
        }
    }
}

#Preview {
    ContentView()  // ContentView를 미리 보기로 표시
}
