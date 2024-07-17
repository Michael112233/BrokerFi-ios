//
//  WelcomeBackView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct WelcomeBackView: View {
    @State private var password :String = ""
    @State private var turnToHome :Bool = false
    @State private var showError = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(height: getFrame().getHeight(requiredHeight: 96))
            
            VStack(spacing: 8) {
                Text("Welcome back")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                Text("Connecting you to the decentralized world")
            }
            
            SecureField("Password", text: $password)
                .textFieldStyle(PasswordTextFieldStyle())
                .frame(width: getFrame().getWidth(requiredWidth: 350))
            
            Button {
                turnToHome.toggle()
            } label: {
                BlackButton(content: "Unlock", requiredWidth: 350, requiredHeight: 44)
            }.fullScreenCover(isPresented: $turnToHome, content: {
                HomeView()
            })
            
            Button {
                showError.toggle()
            } label: {
                Text("Forget password?")
                    .foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
            }.alert("Still developing.", isPresented: $showError) {
                Button("Cancel", role: .cancel) {}
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350))
    }
}

#Preview {
    WelcomeBackView()
}
