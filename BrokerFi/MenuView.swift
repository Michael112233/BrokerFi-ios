//
//  MenuView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var ispresentedSend: Bool = false
    @State private var ispresentedReceive: Bool = false
    @State private var ispresentedActivity: Bool = false
    @State private var ispresentedSetting: Bool = false
    @State private var ispresentedSupport: Bool = false
    @State private var ispresentedLock: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            ShowMenuView()
            
            Text("Menu")
                .font(.system(size: getFrame().getHeight(requiredHeight: 36)))
                .fontWeight(.black)
                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 60), alignment: .leading)
            
            VStack(alignment: .center, spacing: 0) {
                // Send
                Button {
                    ispresentedSend.toggle()
                } label: {
                    MenuLineView(hasCircle: true, iconName: "scan", text: "Send (Scan QRCode)")
                }.fullScreenCover(isPresented: $ispresentedSend, content: {
                    ScannerView()
                })
                
                // recieve
                Button {
                    ispresentedReceive.toggle()
                } label: {
                    MenuLineView(hasCircle: true, iconName: "qrcode", text: "Receive")
                }.fullScreenCover(isPresented: $ispresentedReceive, content: {
                    ReceiveView()
                })
                
                // activity
                Button {
                    ispresentedActivity.toggle()
                } label: {
                    MenuLineView(hasCircle: true, iconName: "database", text: "Activity")
                }.fullScreenCover(isPresented: $ispresentedActivity, content: {
                    ActivityView()
                })
                
                //setting
                Button {
                    ispresentedSetting.toggle()
                } label: {
                    MenuLineView(hasCircle: true, iconName: "setting", text: "Setting")
                }.fullScreenCover(isPresented: $ispresentedSetting, content: {
                    SettingView()
                })
                
                //support
                Button {
                    ispresentedSupport.toggle()
                } label: {
                    MenuLineView(hasCircle: true, iconName: "question-circle (1)", text: "Support")
                }.alert("Still developing.", isPresented: $ispresentedSupport) {
                    Button("Cancel", role: .cancel) {}
                }
                
                //lock
                Button {
                    ispresentedLock.toggle()
                } label: {
                    MenuLineView(hasCircle: true, iconName: "lock", text: "Lock BrokerFi")
                }.fullScreenCover(isPresented: $ispresentedLock, content: {
                    WelcomeBackView()
                })
            }
            
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    MenuView()
}
