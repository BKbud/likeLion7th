//
//  ViewController.swift
//  FormDemo
//
//  Created by 정보경 on 3/17/25.
//

import UIKit

// label, toggle, textField를 가지는 그룹 뷰 생성
class GroupBoxViewController: UIViewController {
    
    var flag = false
    let groupBox = UIView()
    let groupBoxLabel = UILabel()
    let toggle = UISwitch()
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGroupBox()
    }
    
    func setupGroupBox() {
        // layer에는 뷰 자체에 대한 설정 값이 들어있다. (실제로 그려질때 필요한 부속품들)
        groupBox.layer.borderWidth = 1
        groupBox.layer.borderColor = UIColor.lightGray.cgColor
        groupBox.layer.cornerRadius = 8
        // Auto Layout을 사용하기 위해 translatesAutoresizingMaskIntoConstraints를 false로 설정
        groupBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groupBox)
        
        // Auto Layout을 사용하여 groupBox의 제약 조건 설정
        NSLayoutConstraint.activate([
            groupBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            groupBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            groupBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            groupBox.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}

