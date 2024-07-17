//
//  SwapView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct SwapView: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Swap")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Swapping crypto is now easy and secure")
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            Image(systemName: "square.dashed")
                .resizable()
                .frame(width: screenWidth/390*350, height: screenHeight/844*197)
            
            Text("Allow BrokerFi to programmatically optimize your swaps to assist with:")
                .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            
            VStack(spacing: 10) {
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Lower your transaction expenses")
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Decrease the chances of transaction errors")
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Avoid transactions from getting jammed")
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Guard against front-running *")
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 22), alignment: .leading)
            }
            
            HStack(alignment: .center) {
                BlackButton(content: "Get started", requiredWidth: 350, requiredHeight: 44)
            }
            
            Text("This feature will be available in early 2024")
                .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                .frame(width: getFrame().getWidth(requiredWidth: 350))
                .foregroundColor(.gray)
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    SwapView()
}
