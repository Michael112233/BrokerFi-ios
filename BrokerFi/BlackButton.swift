//
//  BlackButton.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct BlackButton: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height

    var content :String = ""
    var requiredWidth :CGFloat = 0
    var requiredHeight :CGFloat = 0
    var body: some View {
        Text(content)
            .padding()
            .frame(width: screenWidth/390*requiredWidth, height: screenHeight/844*requiredHeight, alignment: .center)
            .font(.system(size: screenWidth*0.048))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(9999)
    }
}

#Preview {
    BlackButton(content: "hhhh", requiredWidth: 100, requiredHeight: 44)
}
