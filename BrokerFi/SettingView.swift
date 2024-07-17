//
//  SettingView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct SettingView: View {
    @State private var chooseAccounts :Bool = false
    @State private var chooseNetworks :Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            AddMenuView()
            
            Text("Settings")
                .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                .fontWeight(.black)
                .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            
            Button {
                chooseAccounts.toggle()
            } label: {
                MenuLineView(hasCircle: true, iconName: "user", text: "Accounts")
            }.fullScreenCover(isPresented: $chooseAccounts) {
                SelectAccountView()
            }
            
            Button {
                chooseNetworks.toggle()
            } label: {
                MenuLineView(hasCircle: true, iconName: "apartment", text: "Networks")
            }.fullScreenCover(isPresented: $chooseNetworks) {
                SelectNetworkView()
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    SettingView()
}
