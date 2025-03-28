//
//  ViewController.swift
//  HelloWorld
//
//  Created by 정보경 on 3/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("1. ViewController.viewDidLoad()")
        
        setupUI()
    }
    
    func setupUI() {
        print("7 ViewController.setupUI()")
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        // frame layout
        label.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        view.addSubview(label)
        
        // 버튼 추가
        let button = UIButton()
        button.setTitle("Go Second", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 40)
        button.addTarget(self, action: #selector(goSecond), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    @objc func goSecond() {
        let secondVC = SecondViewController()
        self.present(secondVC, animated: true) //modal view처럼 밑에서 창이 올라옴
    }
}

