//
//  LoginAppSwiftUIApp.swift
//  LoginAppSwiftUI
//
//  Created by Ярослав Бойко on 01.12.2021.
//

import SwiftUI

@main
struct LoginAppSwiftUIApp: App {
    private let user = StorageManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
