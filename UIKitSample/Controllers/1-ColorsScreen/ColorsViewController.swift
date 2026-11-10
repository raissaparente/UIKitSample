//
//  ColorsViewController.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import UIKit

class ColorsViewController: UIViewController {

    let stack = UIStackView()
    
    let rect1 = UIView()
    let rect2 = UIView()
    let rect3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stack)
        
        stack.addArrangedSubview(rect1)
        stack.addArrangedSubview(rect2)
        stack.addArrangedSubview(rect3)
        
        stack.axis = .vertical
        stack.spacing = 8
        
        stack.distribution = .fillEqually
        
        rect1.backgroundColor = .systemRed
        rect2.backgroundColor = .systemGreen
        rect3.backgroundColor = .systemBlue
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        stack.frame = view.safeAreaLayoutGuide.layoutFrame
//        stack.translatesAutoresizingMaskIntoConstraints = false
    }

}

#Preview {
    ColorsViewController()
}

//import SwiftUI
//
//#Preview {
//    VStack {
//       Color.red
//       Color.green
//       Color.blue
//     }
//    .ignoresSafeArea()
//}
