//
//  AccountListView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct AccountListView: View {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    var accountName :String = ""
    var accountKey :String = ""
    
    var body: some View {
        HStack(spacing: screenWidth/390*16) {
            ZStack() {
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth/390*44)
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth/390*24)
                    .colorInvert()
            }.foregroundColor(.black)
            
            VStack(spacing: 0) {
                Text(accountName)
                    .font(.system(size: screenHeight/844*16))
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: screenWidth/390*160, height: screenHeight/844*16, alignment: .leading)
                Text(accountKey)
                    .font(.system(size: screenHeight/844*12))
                    .frame(width: screenWidth/390*160, height: screenHeight/844*16)
            }
        }.frame(width: screenWidth/390*350, alignment: .leading)
    }
}

#Preview {
    AccountListView(accountName: "Account1", accountKey: "0x7135B24d2387A6Eb17d810bE19ECE92B8a8a3263")
}
