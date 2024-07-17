//
//  HomeIconView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct HomeIconView: View {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    var hasCircle = false;
    var iconName = ""
    var text = ""
    
    var body: some View {
        VStack {
            if(hasCircle == true) {
                ZStack() {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth/390*44)
                    Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth/390*18)
                        .colorInvert()
                }.foregroundColor(.black)
            } else {
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth/390*40)
            }
            Text(text)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    HomeIconView(hasCircle: true, iconName: "plus", text: "Buy")
}
