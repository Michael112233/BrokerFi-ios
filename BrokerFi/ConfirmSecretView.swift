//
//  ConfirmSecretView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct ConfirmSecretView: View {
    @State private var inputPhrases: String = ""
    @State private var check: Bool = true
    @State private var congratulationClicked = false
    
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
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Confirm your Secret Recovery Phrase")
                    .fontWeight(.black)
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                Text("Please input your Secret Recovery Phrase to make sure it is correct.")
            }
            
            PhraseTextField()
            
            Button {
                if check {
                    congratulationClicked.toggle()
                }
            } label: {
                BlackButton(content: "Confirm", requiredWidth: 350, requiredHeight: 44)
            }.fullScreenCover(isPresented: $congratulationClicked, content: {
                CongratulationView()
            })
        }
        .frame(width: getFrame().getWidth(requiredWidth: 350))
    }
}

#Preview {
    ConfirmSecretView()
}
