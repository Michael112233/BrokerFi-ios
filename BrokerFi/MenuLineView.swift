//
//  MenuLineView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct MenuLineView: View {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    var hasCircle = false;
    var iconName = ""
    var text = ""
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                if(hasCircle == true) {
                    ZStack() {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth/390*40)
                        Image(iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth/390*18)
                            .colorInvert()
                    }
                } else {
                    Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth/390*40)
                }
                Text(text)
                    .font(.system(size: screenHeight/844*18))
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(alignment: .leading)
            }.frame(width: screenWidth/390*350, height: screenHeight/844*40, alignment: .leading)
                .foregroundColor(.black)
            
            Image("right")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth/390*350, height: screenHeight/844*18, alignment: .trailing)
        }.frame(height: screenHeight/844*72, alignment: .center)
        
    }
}

#Preview {
    MenuLineView(hasCircle: true, iconName: "scan", text: "Send (Scan QRCode)")
}
