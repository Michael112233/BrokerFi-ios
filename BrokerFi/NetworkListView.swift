//
//  NetworkListView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct NetworkListView: View {
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
                            .frame(width: screenWidth/390*44)
                        Image(iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth/390*24)
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
            }.frame(width: screenWidth/390*350, height: screenHeight/844*44, alignment: .leading)
                .foregroundColor(.black)

        }.frame(height: screenHeight/844*72, alignment: .center)
        
    }
}

#Preview {
    NetworkListView(hasCircle: true, iconName: "sketch", text: "Main network")
}
