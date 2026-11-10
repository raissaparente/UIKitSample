//
//  NameViewController.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    private var name = "" {
        didSet {
            label.text = name
        }
    }
    
    deinit {
        print(self, #function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = name
    }

    @IBAction func onTextFieldChanged(_ sender: Any) {
        self.name = self.textField.text!
    }
}

#Preview {
    UIStoryboard(name: "NameStoryboard", bundle: .main)
        .instantiateInitialViewController() as! NameViewController
}
