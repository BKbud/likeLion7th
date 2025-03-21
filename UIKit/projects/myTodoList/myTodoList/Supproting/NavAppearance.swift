//
//  NavAppearance.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

extension UINavigationController {
    
    func setupBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//        appearance.backgroundColor = .systemIndigo
        
        // 앱바 아래 구분선 없애기
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .white
        
        // 기타 설정
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        
        // 버튼 색상
        self.navigationBar.tintColor = .black
    }
}
