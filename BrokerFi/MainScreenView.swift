//
//  MainScreenView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/13.
//

import SwiftUI

struct MainScreenView: View {
//    var screenWidth = UIScreen.main.bounds.width
//    var screenHeight = UIScreen.main.bounds.height
    @State private var createClicked = false;
    @State private var importClicked = false;
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 25) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: getFrame().getHeight(requiredHeight: 96))
                
                VStack(spacing: getFrame().getHeight(requiredHeight: 16)) {
                    Text("Welcome to BrokerFi")
                        .fontWeight(.black)
                        .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    Text("Connecting you to the decentralized world")
                        .font(.system(size: getFrame().getHeight(requiredHeight: 16)))
                }
                
                Button {
                    createClicked.toggle()
                } label: {
                    BlackButton(content: "Create a wallet", requiredWidth: 180, requiredHeight: 50)
                }.fullScreenCover(isPresented: $createClicked, content: {
                    CreatePasswordView()
                })
                
                Button {
                    importClicked.toggle()
                } label: {
                    Text("Import existing wallet?")
                        .foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
                }
                .fullScreenCover(isPresented: $importClicked, content: {
                    ImportWalletView()
                })
            }
            .padding()
        }
    }
    
}

#Preview {
    MainScreenView()
}
