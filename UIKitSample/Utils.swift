//
//  Utils.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues on 28/09/24.
//

import SwiftUI

extension UIView {
    func addPinnedSubview(_ view: some View) {
        let configuration = UIHostingConfiguration { view }
        let subview = configuration.margins(.all, 0).makeContentView()
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension View {
    func onUIKit(perform action: @escaping ((UIViewController) -> Void)) -> some View {
        self
            .onAppear {
                DispatchQueue.main.async {
                    guard let rootViewController = UIApplication
                        .shared
                        .connectedScenes
                        .compactMap({ $0 as? UIWindowScene })
                        .flatMap({ $0.windows })
                        .first(where: { $0.isKeyWindow == true })?
                        .rootViewController
                    else {
                        return
                    }
                    action(rootViewController)
                }
            }
    }
}
