//
//  BrokerMenuView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/20.
//

import SwiftUI

struct BrokerMenuView: View {
    @State private var startClick = false
    @State private var learnClick = false
    
    var body: some View {
        VStack(spacing: getFrame().getHeight(requiredHeight: 16)) {
            AddMenuView()
            
            VStack {
                Text("Broker")
                    .fontWeight(.black)
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("A cutting-edge blockchain technology")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 16)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            Image(systemName: "square.dashed")
                .resizable()
                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 196.88))
            Text("To maintain a more balanced system operation, BrokerFi incorporates a mechanism called 'Broker'.")
                .frame(width: getFrame().getWidth(requiredWidth: 350))
            Text("Anyone can stake funds to become a Broker, and reasons to do so include:")
                .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            
            VStack(spacing: getFrame().getWidth(requiredWidth: 10)) {
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Assisting the system to run faster")
                        .font(.system(size: getFrame().getWidth(requiredWidth: 16)))
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Earning rewards as a Broker")
                        .font(.system(size: getFrame().getWidth(requiredWidth: 16)))
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Funds are 100% safe without any risk")
                        .font(.system(size: getFrame().getWidth(requiredWidth: 16)))
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
                HStack(alignment: .top) {
                    CircleTick()
                        .frame(width: getFrame().getWidth(requiredWidth: 20))
                    Text("Withdrawals can be made at any time")
                        .font(.system(size: getFrame().getWidth(requiredWidth: 16)))
                        .frame(width: getFrame().getWidth(requiredWidth: 322), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
            }
            
            Button {
                startClick.toggle()
            } label: {
                BlackButton(content: "Get started", requiredWidth: 350, requiredHeight: 40)
            }.fullScreenCover(isPresented: $startClick, content: {
                StakeView()
            })
            
            Button {
                
            } label: {
                Text("Learn more about what a broker is?")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                    .foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
            }.alert("Still developing.", isPresented: $learnClick) {
                Button("Cancel", role: .cancel) {}
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    BrokerMenuView()
}
