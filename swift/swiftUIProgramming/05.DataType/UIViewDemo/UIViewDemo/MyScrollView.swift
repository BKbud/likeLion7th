//
//  MyScrollView.swift
//  UIViewDemo
//
//  Created by 정보경 on 1/23/25.
//

import SwiftUI

struct MyScrollView: UIViewRepresentable {
    var text: String
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var control: MyScrollView
        
        init(_ control: MyScrollView) {
            self.control = control
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            print("View is Scrolling")
        }
        
        @objc func handleRefresh(sender: UIRefreshControl) {
            sender.endRefreshing()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // UIViewRepresentable 프로토콜을 따르는 함수로, 실제 UIKit 뷰인 UIScrollView를 생성합니다.
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()  // UIScrollView 객체를 생성합니다.
        scrollView.delegate = context.coordinator
        
        // UIRefreshControl을 생성하여 ScrollView의 refresh control로 추가합니다.
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(context.coordinator.handleRefresh(sender:)), for: .valueChanged)
        
        // UILabel을 생성하여 그 크기와 위치를 설정합니다.
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        
        // UILabel의 텍스트를 외부에서 전달받은 텍스트로 설정합니다.
        myLabel.text = text
        
        // UIScrollView에 UILabel을 추가합니다.
        scrollView.addSubview(myLabel)
        
        // UIScrollView 객체를 반환합니다.
        return scrollView
    }
    
    // 뷰가 업데이트 될 때 호출되는 함수입니다. 여기서는 특별히 업데이트할 내용이 없어서 빈 상태입니다.
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // 이 함수는 SwiftUI에서 뷰의 상태가 변경되었을 때 호출됩니다. 현재는 내용이 없지만
        // 예를 들어 텍스트가 바뀌었을 때 UILabel의 텍스트를 업데이트할 수 있습니다.
    }
}

#Preview {
    MyScrollView(text: "Hello World!")
}
