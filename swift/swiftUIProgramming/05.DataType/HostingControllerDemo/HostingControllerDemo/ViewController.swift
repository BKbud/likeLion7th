//
//  ViewController.swift
//  HostingControllerDemo
//
//  Created by 정보경 on 1/23/25.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let swiftUIController = UIHostingController(rootView: SwiftUIView())
//        addChild(swiftUIController)
//        swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(swiftUIController.view?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true)
    }
    @IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    @IBSegueAction func showSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    

}

