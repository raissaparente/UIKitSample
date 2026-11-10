//
//  User.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import SwiftData

@Model
class User {
    var name: String
    var birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
}
