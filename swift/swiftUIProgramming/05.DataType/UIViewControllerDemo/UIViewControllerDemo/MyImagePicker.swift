//
//  MyImagePicker.swift
//  UIViewControllerDemo
//
//  Created by 정보경 on 1/23/25.
//

import SwiftUI

// SwiftUI에서 UIImagePickerController를 사용할 수 있도록 래핑한 구조체입니다.
struct MyImagePicker: UIViewControllerRepresentable {
    
    // imagePickerVisible은 이미지 선택 화면의 표시 여부를 관리하는 Binding 변수입니다.
    @Binding var imagePickerVisible: Bool
    
    // selectedImage는 사용자가 선택한 이미지를 저장할 Binding 변수입니다.
    @Binding var selectedImage: Image?
    
    // makeUIViewController는 실제 UIKit 뷰컨트롤러인 UIImagePickerController를 생성하여 반환합니다.
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()  // UIImagePickerController 객체를 생성합니다.
        
        // context.coordinator는 SwiftUI에서 UIKit의 delegate 역할을 담당하는 객체입니다.
        picker.delegate = context.coordinator  // delegate를 Coordinator로 설정합니다.
        
        return picker  // 생성된 UIImagePickerController 객체를 반환합니다.
    }
    
    // updateUIViewController는 뷰가 업데이트 될 때 호출됩니다.
    // 이 함수는 현재 특별한 처리가 필요 없으므로 빈 상태로 두었습니다.
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // 이미지 피커 상태를 업데이트하거나 다른 설정을 바꿀 때 여기를 사용합니다.
    }
    
    // makeCoordinator 함수는 Coordinator 객체를 반환합니다.
    // 이 Coordinator는 UIImagePickerControllerDelegate와 UINavigationControllerDelegate를 구현하여
    // 이미지 선택 및 취소 이벤트를 처리합니다.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // UIImagePickerController의 delegate 역할을 하는 클래스입니다.
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        // MyImagePicker 객체를 참조하는 변수입니다.
        let parent: MyImagePicker
        
        // 초기화 시 parent(상위 뷰) 객체를 받습니다.
        init(_ parent: MyImagePicker) {
            self.parent = parent
        }
        
        // 사용자가 이미지를 선택했을 때 호출되는 델리게이트 메서드입니다.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 선택한 이미지가 있다면, 이를 UIImage로 가져오고, SwiftUI Image로 변환하여 selectedImage에 저장합니다.
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: image)
            }
            
            // 이미지 선택 후 피커 화면을 닫기 위해 imagePickerVisible을 false로 설정합니다.
            parent.imagePickerVisible = false
        }
        
        // 사용자가 이미지 선택을 취소했을 때 호출되는 델리게이트 메서드입니다.
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // 이미지 선택을 취소한 경우 피커 화면을 닫기 위해 imagePickerVisible을 false로 설정합니다.
            parent.imagePickerVisible = false
        }
    }
}

// SwiftUI Previews로 미리 보기 기능을 제공합니다.
// 이 코드에서는 imagePickerVisible을 false로 설정하여 이미지 피커가 기본적으로 보이지 않게 하고,
// selectedImage는 초기값으로 nil로 설정하여 이미지가 선택되지 않은 상태로 미리 보기 화면을 표시합니다.
#Preview {
    MyImagePicker(imagePickerVisible: .constant(false), selectedImage: .constant(nil))
}
