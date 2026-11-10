//
//  CountViewController.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import UIKit

class CountViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    private var count = 0 {
        didSet {
            updateButtonImage()
        }
    }
    
    init?(initialCount: Int, coder: NSCoder) {
        self.count = initialCount
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.configuration?.buttonSize = .large
        button.configuration?.cornerStyle = .large
        button.configuration?.background.strokeOutset = 5
        button.configuration?.background.strokeWidth = 2
        button.configuration?.background.strokeColor = .systemBlue
        button.configurationUpdateHandler = { button in
            if button.state == .disabled {
                button.configuration?.background.strokeColor = .gray.withProminence(.secondary)
            }
        }
        button.addAction(
            UIAction { [unowned self] _ in
                guard self.count < 50 else {
                    return
                }
                self.count += 1
                if self.count == 50 {
                    self.button.isEnabled = false
                }
            },
            for: .primaryActionTriggered
        )
        updateButtonImage()
    }
    
    func updateButtonImage() {
        button.configuration?.image = UIImage(
            systemName: "\(count).circle",
            withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 50))
        )
    }

}

#Preview {
    UIStoryboard(name: "CountStoryboard", bundle: .main).instantiateInitialViewController { coder in
        CountViewController(initialCount: 45, coder: coder)
    }!
}
