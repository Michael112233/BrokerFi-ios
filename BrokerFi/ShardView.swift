//
//  ShardView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/21.
//

import SwiftUI

struct ShardView: View {
    @State private var ispresentedStake :Bool = false
    @State private var ispresentedWithdraw :Bool = false
    
    var body: some View {
        VStack(spacing: getFrame().getHeight(requiredHeight: 16)) {
            ZStack {
                VStack {
                    Text("100 BKC")
                        .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                    Text("$1200.00 USD")
                        .foregroundColor(.white)
                        .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                
                VStack {
                    Text("+22 BKC")
                        .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 134/255, green: 239/255, blue: 172/255))
                        .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .trailing)
                    Text("Broker profit")
                        .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                        .foregroundColor(.white)
                        .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .trailing)
                }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 68), alignment: .center)
            }
            
            ScrollView {
                VStack {
                    ProgressView(shardName: "SHARD 1", participate: "7558", total: "68384")
                    ProgressView(shardName: "SHARD 2", participate: "36987", total: "68992")
                    ProgressView(shardName: "SHARD 3", participate: "1293", total: "83985")
                    ProgressView(shardName: "SHARD 4", participate: "12724", total: "44337")
                    ProgressView(shardName: "SHARD 5", participate: "839", total: "39925")
                    ProgressView(shardName: "SHARD 6", participate: "34392", total: "73651")
                    ProgressView(shardName: "SHARD 7", participate: "39080", total: "47179")
                    ProgressView(shardName: "SHARD 8", participate: "38157", total: "79835")
                    ProgressView(shardName: "SHARD 9", participate: "17001", total: "35517")
                    ProgressView(shardName: "SHARD 10", participate: "44015", total: "76228")
                    ProgressView(shardName: "SHARD 11", participate: "9953", total: "16630")
                    ProgressView(shardName: "SHARD 12", participate: "60566", total: "80389")
                    ProgressView(shardName: "SHARD 13", participate: "87029", total: "93269")
                    ProgressView(shardName: "SHARD 14", participate: "7895", total: "71931")
                    ProgressView(shardName: "SHARD 15", participate: "1447", total: "1527")
                    ProgressView(shardName: "SHARD 16", participate: "5913", total: "12465")
                }
            }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 360))
            
            HStack(spacing: getFrame().getWidth(requiredWidth: 16)) {
                Button {
                    ispresentedStake.toggle()
                } label: {
                    HStack {
                        Image("fire")
                            .resizable()
                            .scaledToFit()
                            .frame(height: getFrame().getWidth(requiredWidth: 18))
                            .colorInvert()
                        Text("Stake more")
                            .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                            .foregroundColor(.white)
                    }.frame(width: getFrame().getWidth(requiredWidth: 167), height: getFrame().getHeight(requiredHeight: 44), alignment: .center)
                     .overlay(
                            RoundedRectangle(cornerRadius: 9999)
                                .stroke(Color(red: 134/255, green: 239/255, blue: 172/255), lineWidth: 2)
                        )
                }.fullScreenCover(isPresented: $ispresentedStake, content: {
                    StakeView()
                })
                
                Button {
                    ispresentedWithdraw.toggle()
                } label: {
                    HStack {
                        Image("smile")
                            .resizable()
                            .scaledToFit()
                            .frame(height: getFrame().getWidth(requiredWidth: 18))
                            .colorInvert()
                        Text("Withdraw")
                            .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                            .foregroundColor(.white)
                    }.frame(width: getFrame().getWidth(requiredWidth: 167), height: getFrame().getHeight(requiredHeight: 44), alignment: .center)
                     .overlay(
                            RoundedRectangle(cornerRadius: 9999)
                                .stroke(Color(red: 252/255, green: 165/255, blue: 165/255), lineWidth: 2)
                        )
                }.fullScreenCover(isPresented: $ispresentedWithdraw, content: {
                    WithdrawView()
                })
            }.frame(height: getFrame().getHeight(requiredHeight: 60), alignment: .top)
        }.background(.black)
         .frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 520))
    }
}

#Preview {
    ShardView()
}
