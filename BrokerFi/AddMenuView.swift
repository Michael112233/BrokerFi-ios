//
//  AddMenuView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct AddMenuView: View {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    @State private var ispresented: Bool = false
    @State public var isHome: Bool = false
    @State private var ispresentedHome: Bool = false
    
    var body: some View {
        VStack(spacing: 5) {
            if(!isHome) {
                Button {
                    ispresentedHome.toggle()
                } label: {
                    HStack(spacing: 0) {
                        Image("left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: getFrame().getWidth(requiredWidth: 16))
                            .foregroundColor(.blue)
                        Text("Back")
                            .font(.system(size: getFrame().getHeight(requiredHeight: 16)))
                            .foregroundColor(.blue)
                    }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                }.fullScreenCover(isPresented: $ispresentedHome, content: {
                    HomeView()
                })
            }
            ZStack {
                TabView()
                
                Button {
                    ispresented.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth/390*350, height: screenHeight/844*36, alignment: .trailing)
                }
    //            Image("menu")
    //                .resizable()
    //                .scaledToFit()
    //                .frame(width: screenWidth/390*350, height: screenHeight/844*36, alignment: .trailing)
                    .fullScreenCover(isPresented: $ispresented, content: {
                        MenuView()
                    })
                
            }.frame(height: screenHeight/844*80)
        }.frame(width: getFrame().getWidth(requiredWidth: 350))
    }
}

#Preview {
    AddMenuView()
}
