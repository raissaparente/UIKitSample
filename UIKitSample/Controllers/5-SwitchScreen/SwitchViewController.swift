//
//  SwitchViewController.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import UIKit
import SwiftUI

class SwitchViewController: UIViewController {
    
    let model = SwitchModel()
    
    let switch1 = UISwitch()
    
    lazy var switch2 = UIHostingConfiguration {
        SwitchView(model: model)
    }
        .margins(.all, 0)
        .makeContentView()
        
    deinit {
        print(type(of: self), #function)
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(switch1)
        switch1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switch1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switch1.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
        ])
        
        view.addSubview(switch2)
        switch2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switch2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switch2.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch1.thumbTintColor = .systemGreen
        switch1.onTintColor = .systemGreen.withProminence(.tertiary)
        switch1.addAction(
            UIAction { [unowned self] _ in
                self.model.isOn = switch1.isOn
            },
            for: .valueChanged
        )
        
        bindModelToSwitch1()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    func bindModelToSwitch1() {
        withObservationTracking {
            switch1.setOn(model.isOn, animated: true)
        } onChange: { [unowned self] in
            DispatchQueue.main.async {
                self.bindModelToSwitch1()
            }
        }
    }
    
}


#Preview {
    SwitchViewController()
}

