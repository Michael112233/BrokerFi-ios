//
//  MyAccountView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/15.
//

import SwiftUI
import UIKit

struct MyAccountView: View {
    var name :String = "My Account 1"
    var address :String = "0x7135B24d2387A6Eb17d810bE19ECE92B8a8a3263"
    @State private var isSaved :Bool = false
    @State private var isCopied :Bool = false
    @State private var showPriavteKeyClick = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text(name)
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text(address)
                    .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                        .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            let qrcode = generateQRCode(string: address)
            Image(uiImage: qrcode)
                .resizable()
                .scaledToFit()
            
            HStack(alignment: .center) {
                Button {
                    UIPasteboard.general.string = address
                    isCopied.toggle()
                } label: {
                    Text("Copy address")
                        .padding()
                        .frame(width: getFrame().getWidth(requiredWidth: 171), height: getFrame().getHeight(requiredHeight: 44), alignment: .center)
                        .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9999)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }.alert("Copy Successfully!", isPresented: $isCopied) {
                    Button("OK", role: .cancel){
                    }
                }
                
                Button {
                    
                } label: {
                    BlackButton(content: "Save QRCode", requiredWidth: 171, requiredHeight: 44)
                }.alert("Save successfully!", isPresented: $isSaved) {
                    Button("OK", role: .cancel){
                    }
                }
            }
            
            Button {
                showPriavteKeyClick.toggle()
            } label: {
                HStack() {
                    Image("lock")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
                        .frame(height: getFrame().getHeight(requiredHeight: 15))
                        .opacity(0.5)
                    Text("Show private key")
                        .foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
                }.frame(width: getFrame().getWidth(requiredWidth: 350))
            }.fullScreenCover(isPresented: $showPriavteKeyClick, content: {
                ShowPrivateKeyView()
            })
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    MyAccountView()
}
