//
//  AddAccountView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/15.
//

import SwiftUI

struct AddAccountView: View {
    @State private var accountName :String = ""
    @State private var isCancelled :Bool = false
    @State private var isSaved :Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Add account")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Explain what is an account here")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            VStack(spacing: 10) {
                Text("Account name")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                TextField("", text: $accountName)
                    .textFieldStyle(PasswordTextFieldStyle())
                    .frame(height: getFrame().getHeight(requiredHeight: 44))
            }
            
            HStack(alignment: .center) {
                Button {
                    isCancelled.toggle()
                } label: {
                    Text("Cancel")
                        .padding()
                        .frame(width: getFrame().getWidth(requiredWidth: 171), height: getFrame().getHeight(requiredHeight: 44), alignment: .center)
                        .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                        .fontWeight(.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9999)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .foregroundColor(.black)
                }.fullScreenCover(isPresented: $isCancelled) {
                    SelectAccountView()
                }
                
                Button {
                    UIPasteboard.general.string = accountName
                    isSaved.toggle()
                } label: {
                    BlackButton(content: "Save", requiredWidth: 171, requiredHeight: 44)
                }.alert("Save successfully!", isPresented: $isSaved) {
                    Button("OK", role: .cancel){
                    }
                }
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    AddAccountView()
}
