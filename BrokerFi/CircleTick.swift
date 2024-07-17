//
//  CircleTick.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct CircleTick: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth/390*20)
            Image("check")
                .resizable()
                .scaledToFit()
                .colorInvert()
                .frame(width: screenWidth/390*12)
        }
    }
}

#Preview {
    CircleTick()
}
