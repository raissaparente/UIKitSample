import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("Hello, world!")
    }
}

#Preview("SwiftUI") {
    ContentView()
}

import UIKit

class ContentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Hello, world!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


#Preview("UIKit") {
    ContentViewController()
}
