//
//  ProgressView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/21.
//

import SwiftUI

struct ProgressView: View {
    public var shardName :String = ""
    public var participate :String = ""
    public var total :String = ""
    private let info = getFrame()
    
    var body: some View {
        VStack(spacing: info.getHeight(requiredHeight: 2)) {
            ZStack {
                Text(shardName)
                    .font(.system(size: info.getHeight(requiredHeight: 14)))
                    .frame(width: info.getHeight(requiredHeight: 350), alignment: .leading)
                    .foregroundColor(.white)
                
                Text(participate+"/"+total)
                    .font(.system(size: info.getHeight(requiredHeight: 14)))
                    .frame(width: info.getWidth(requiredWidth: 350), alignment: .trailing)
                    .foregroundColor(.white)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 9999)
                    .foregroundColor(Color(red: 156/255, green: 163/255, blue: 175/255))
                    .frame(width: info.getWidth(requiredWidth: 350), height: info.getHeight(requiredHeight: 8))
                HStack {
                    RoundedRectangle(cornerRadius: 9999)
                        .foregroundColor(Color(red: 134/255, green: 239/255, blue: 172/255))
                        .frame(width: info.getWidth(requiredWidth: 350/Double(total)!*Double(participate)!), height: info.getHeight(requiredHeight: 8), alignment: .leading)
                }.frame(width: info.getWidth(requiredWidth: 350), height: info.getHeight(requiredHeight: 8), alignment: .leading)
            }
        }.frame(width: info.getWidth(requiredWidth: 382), height: info.getHeight(requiredHeight: 28))
        .background(.black)
    }
}

#Preview {
    ProgressView(shardName: "Shard 1", participate: "7558", total: "68384")
}
