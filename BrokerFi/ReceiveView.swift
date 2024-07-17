//
//  RecieveView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI
import UIKit

struct ReceiveView: View {
    var to :String = "0x7135B24d2387A6Eb17d810bE19ECE92B8a8a3263"
    var qrcode: UIImage = .init()
    @State private var toString :String = ""
    @State private var isSaved :Bool = false
    @State private var isCopied :Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Receive")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Generate a secure address to receive coins from others")
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Receive to")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                        .frame(height: getFrame().getHeight(requiredHeight: 56))
                    ScrollView(.horizontal) {
                        Text(to)
                    }   .frame(width: getFrame().getWidth(requiredWidth: 318), height: getFrame().getHeight(requiredHeight: 56), alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            
            
            
            let qrcode = generateQRCode(string: toString)
            Image(uiImage: qrcode)
                .resizable()
                .scaledToFit()
                .frame(width: getFrame().getWidth(requiredWidth: 350))
            
            HStack(alignment: .center) {
                Button {
                    UIPasteboard.general.string = to
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
                    Button("OK!", role: .cancel) {
                    }
                }
                
                Button {
                    saveImage(image: qrcode)
                    isSaved.toggle()
                } label: {
                    BlackButton(content: "Save QRCode", requiredWidth: 171, requiredHeight: 44)
                }.alert("Save successfully!", isPresented: $isSaved) {
                    Button("OK", role: .cancel) {
                    }
                }
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    ReceiveView()
}
