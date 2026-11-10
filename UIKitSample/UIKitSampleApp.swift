//
//  UIKitSampleApp.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import SwiftUI
import UIKit

@main
struct UIKitSampleApp: App {
    var body: some Scene {
        WindowGroup {
            Representable {
                ColorsViewController()
            }
        }
    }
}

struct Representable<UIViewControllerType: UIViewController>: UIViewControllerRepresentable {

    private let content: () -> UIViewControllerType

    init(
        content: @escaping () -> UIViewControllerType
    ) {
        self.content = content
    }

    func makeUIViewController(context: Context) -> UIViewControllerType {
        content()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
