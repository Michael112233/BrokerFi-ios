//
//  ShowMenuView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct ShowMenuView: View {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    @State public var ispresentedHome: Bool = false
    
    var body: some View {
        ZStack {
            TabView()
            
            Button {
                ispresentedHome.toggle()
            } label: {
                Image("up-circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth/390*350, height: screenHeight/844*36, alignment: .trailing)
            }.fullScreenCover(isPresented: $ispresentedHome, content: {
                HomeView()
            })
        }.frame(height: screenHeight/844*80)
    }
}

#Preview {
    ShowMenuView()
}
