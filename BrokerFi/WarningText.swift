//
//  WarningText.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct WarningText: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 254/255, green: 226/255, blue: 226/255))
                .frame(width: screenWidth/390*350, height: screenHeight/844*120)
                .cornerRadius(8)
            HStack {
                Rectangle()
                    .foregroundColor(Color(red: 1, green: 0, blue: 0))
                    .frame(width: screenWidth/390*4, height: screenHeight/844*120)
                    .cornerRadius(8)
            }.frame(width: screenWidth/390*350,
                    height: screenHeight/844*120, alignment: .leading)
                
            VStack(alignment: .center, spacing: screenHeight/844*8) {
                Text("Protect your key at all times.")
                    .foregroundColor(Color(red: 185/255, green: 28/255, blue: 28/255))
                    .frame(width: screenWidth/390*314, alignment: .leading)
                Text("Possession of your private keys allows unauthorized access and potential theft of your assets.")
                    .foregroundColor(Color(red: 185/255, green: 28/255, blue: 28/255))
                    .lineSpacing(5)
                    .frame(width: screenWidth/390*314, alignment: .leading)
            }.frame(height: screenHeight/844*104)
        }
    }
}

#Preview {
    WarningText()
}
