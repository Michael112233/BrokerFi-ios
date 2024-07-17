//
//  CreatePasswordView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/13.
//

import SwiftUI
import UIKit

struct CreatePasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var haveRead: Bool = false
    @State private var check: Bool = true
    @State private var showError: Bool = false
    @State private var showSecret: Bool = false
    @State private var showError1: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: getFrame().getWidth(requiredWidth: 48))
                HStack(spacing: 0) {
                    Text("Broker")
                    Text("Fi").foregroundColor(.red)
                }
                .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                .fontWeight(.bold)
                Color(.clear)
            }.frame(height: getFrame().getHeight(requiredHeight: 48))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Create Password")
                    .fontWeight(.black)
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                Text("Explain why users need a password here")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("New password")
                SecureField("", text: $newPassword)
                    .textFieldStyle(PasswordTextFieldStyle())
                Text("Confirm password")
                SecureField("", text: $confirmPassword)
                    .textFieldStyle(PasswordTextFieldStyle())
            }
            
            HStack(spacing: 5) {
                if (haveRead == false) {
                    Button {
                        haveRead = true
                    } label: {
                        Image(systemName: "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: getFrame().getHeight(requiredHeight: 18))
                            .foregroundColor(.black)
                    }
                } else {
                    Button {
                        haveRead = false
                    } label: {
                        ZStack {
                            Image(systemName: "circle")
                                .resizable()
                                .scaledToFit()
                                .frame(height: getFrame().getHeight(requiredHeight: 18))
                                .foregroundColor(.black)
                            Image(systemName: "circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: getFrame().getHeight(requiredHeight: 10))
                                .foregroundColor(.black)
                        }
                    }
                }
                
                HStack(spacing: 0) {
                    Text("I have read and agree to the ")
                    Button {
                        showError.toggle()
                    } label: {
                        Text("Terms of use")
                            .underline()
                            .foregroundColor(.black)
                    }.alert("Still developing.", isPresented: $showError) {
                        Button("Cancel", role: .cancel) {}
                    }
                }
            }
            
            Button {
                if check && haveRead {
                    showSecret.toggle()
                } else {
                    showError1.toggle()
                }
            } label: {
                BlackButton(content: "Create", requiredWidth: 350, requiredHeight: 40)
            }
            .fullScreenCover(isPresented: $showSecret, content: {
                SecretRecoveryView()
            })
            .alert("Still developing.", isPresented: $showError1) {
                Button("Cancel", role: .cancel) {}
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350))
    }
}

#Preview {
    CreatePasswordView()
}
