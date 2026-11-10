//
//  NameViewController2.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import UIKit

class NameViewController2: UIViewController {
    
    let label = UILabel()
    let textField = UITextField()
    
    private var name = "" {
        didSet {
            label.text = name
        }
    }
    
    deinit {
        print(#function)
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(label)
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -50),
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.addAction(
            UIAction { _ in
                self.name = self.textField.text!
            },
            for: .editingChanged
        )
        
    }
    
}

#Preview {
    NameViewController2()
}
