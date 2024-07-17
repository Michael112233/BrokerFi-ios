//
//  BuyView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct BuyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Buy")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Buying crypto is now easy and secure")
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            Image(uiImage: generateQRCode(string: "123456"))
                .resizable()
                .scaledToFit()
                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 197))
            
            Text("We link you up with top-rate quotes from dependable sources and assist you throughout, simplifying the self-custody process.")
                .font(.system(size: getFrame().getWidth(requiredWidth: 14)))
                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 60), alignment: .leading)
            
            VStack {
                HStack(alignment: .top, spacing: 8) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Explore over 75 tokens across more than 8 blockchain networks")
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 48))
                
                HStack(alignment: .top, spacing: 8) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Quickly boost your wallet's balance using safe payment methods")
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 48))
                
                HStack(alignment: .top, spacing: 7) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Cut down on gas fees and save precious time")
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 48))
            }
            
            HStack(alignment: .center) {
                BlackButton(content: "Get started", requiredWidth: 350, requiredHeight: 44)
            }
            
            Text("This feature will be available in early 2024")
                .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                .frame(width: getFrame().getWidth(requiredWidth: 350))
                .foregroundColor(.gray)
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    BuyView()
}
