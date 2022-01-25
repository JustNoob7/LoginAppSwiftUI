//
//  UserManager.swift
//  LoginAppSwiftUI
//
//  Created by Ярослав Бойко on 01.12.2021.
//

import Foundation

final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.username.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var isRegistered = false
    var username = ""
}
