//
//  AddUserView.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import SwiftUI
import SwiftData

struct AddUserView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "Bruno Mars"
    @State private var birthYear = 1985
    
    let onAdd: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Birth Year", value: $birthYear, format: .number)
            }
            .navigationTitle("New User")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Add") {
                    let user = User(name: name, birthYear: birthYear)
                    modelContext.insert(user)
                    onAdd()
                    dismiss()
                }
            }
        }
    }
}
