//
//  ImportWalletView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/13.
//

import SwiftUI

struct ImportWalletView: View {
    @State private var startClicked = false
    
    var body: some View {
        VStack(alignment: .center, spacing: getFrame().getHeight(requiredHeight: 25)) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: getFrame().getHeight(requiredHeight: 96))
            
            VStack(spacing: getFrame().getHeight(requiredHeight: 10)) {
                Text("Import existing wallet")
                    .fontWeight(.black)
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                Text("Using a Secret Recovery Phrase")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 16)))
            }
            
            Button {
                startClicked.toggle()
            } label: {
                BlackButton(content: "Get started", requiredWidth: 160, requiredHeight: 44)
            }.alert("Still developing.", isPresented: $startClicked) {
                Button("Cancel", role: .cancel) {}
            }
        }
        .padding()
    }
}

#Preview {
    ImportWalletView()
}
