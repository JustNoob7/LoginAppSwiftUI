//
//  RegisterView.swift
//  LoginAppSwiftUI
//
//  Created by Ярослав Бойко on 01.12.2021.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter login", text: $userManager.user.username)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        loginButton()
                    }
                Text("\(userManager.user.username.count)")
                    .foregroundColor(userManager.nameIsValid ? .green : .red)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Button(action: loginButton) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .font(.title3)
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
    private func loginButton() {
        userManager.user.isRegistered.toggle()
        StorageManager.shared.save(user: userManager.user)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
