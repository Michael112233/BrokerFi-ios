//
//  SecretRecoveryView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct SecretRecoveryView: View {
    @State private var congratulationClicked = false
    @State private var confirmClicked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack(spacing: 8) {
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
                .frame(width: getFrame().getWidth(requiredWidth: 80))
            }
            .frame(height: getFrame().getHeight(requiredHeight: 48))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Secret Recovery Phrase")
                    .fontWeight(.black)
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                Text("Remember your Secret Recovery Phrase or keep it stored safely on offline device.")
            }
            
            SecretPhraseShow()
            
            HStack {
                Button {
                    congratulationClicked.toggle()
                } label: {
                    Text("Remind me later")
                        .padding()
                        .frame(width: getFrame().getWidth(requiredWidth: 171), height: getFrame().getHeight(requiredHeight: 44), alignment: .center)
                        .fontWeight(.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9999)
                                .stroke(Color.black)
                        )
                        .foregroundColor(.black)
                }.fullScreenCover(isPresented: $congratulationClicked, content: {
                    CongratulationView()
                })
                
                Button {
                    confirmClicked.toggle()
                } label: {
                    BlackButton(content: "Next", requiredWidth: 171, requiredHeight: 44)
                }.fullScreenCover(isPresented: $confirmClicked, content: {
                    ConfirmSecretView()
                })
            }
        }
        .frame(width: getFrame().getWidth(requiredWidth: 350))
    }
}

#Preview {
    SecretRecoveryView()
}
