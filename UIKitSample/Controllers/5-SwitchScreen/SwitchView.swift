//
//  SwitchView.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import SwiftUI

struct SwitchView: View {
    
    @Bindable var model: SwitchModel
    
    var body: some View {
        Toggle("isOn", isOn: $model.isOn)
            .labelsHidden()
            .toggleStyle(.switch)
    }
}
