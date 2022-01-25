//
//  WelcomeView.swift
//  LoginAppSwiftUI
//
//  Created by Ярослав Бойко on 01.12.2021.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        
        VStack(spacing: 100) {
            Text("Hello, \(userManager.user.username)!")
                .font(.largeTitle)
            
            Button(action: logoutButton) {
                Text("Log out")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .frame(width: 200, height: 60)
            .foregroundColor(.black)
            .background(Color.red)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 4)
            )
        }
    }
    
    private func logoutButton() {
        StorageManager.shared.clear(userManager: userManager)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(UserManager())
    }
}
