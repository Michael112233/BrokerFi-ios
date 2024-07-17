//
//  ShowPrivateKeyView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct ShowPrivateKeyView: View {
    @State private var password :String = ""
    @State private var cancelClick = false
    @State private var confirmClick = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Show private key")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Explain what is private key here")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Password")
                SecureField("", text: $password)
                    .textFieldStyle(PasswordTextFieldStyle())
            }
            
            WarningText()
            
            HStack(alignment: .center) {
                Button {
                    cancelClick.toggle()
                } label: {
                    Text("Cancel")
                        .padding()
                        .frame(width: getFrame().getWidth(requiredWidth: 171),
                               height: getFrame().getHeight(requiredHeight: 44), alignment: .center)
                        .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                        .fontWeight(.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9999)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .foregroundColor(.black)
                }.fullScreenCover(isPresented: $cancelClick, content: {
                    MyAccountView()
                })
                
                Button {
                    confirmClick.toggle()
                } label: {
                    BlackButton(content: "Confirm", requiredWidth: 171, requiredHeight: 44)
                }.fullScreenCover(isPresented: $confirmClick, content: {
                    ShowPrivateKeyAfterConfirmView()
                })
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    ShowPrivateKeyView()
}
