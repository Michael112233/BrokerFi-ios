//
//  TabView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct TabView: View {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(height: screenHeight/844*48)
            HStack(spacing: 0) {
                Text("Broker")
                Text("Fi").foregroundColor(.red)
            }
            .font(.system(size: screenHeight/844*18))
            .fontWeight(.bold)
        }.frame(width: screenWidth/390*350, alignment: .leading)
    }
}

#Preview {
    TabView()
}
