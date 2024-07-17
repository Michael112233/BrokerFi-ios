//
//  SingleActivityView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/24.
//

import SwiftUI

struct Line: Identifiable {
    let name: String
    let id: String
}

var greenColor :Color = Color(red: 134/255, green: 239/255, blue: 172/255)
var redColor :Color = Color(red: 252/255, green: 165/255, blue: 165/255)

struct SingleActivityView: View {
    public var info:[Line]
    public var generalInfo:GeneralInfo
    @State private var total = 1
    
    var body: some View {
        ScrollView {
            VStack(spacing: getFrame().getHeight(requiredHeight: 20)) {
                ZStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: getFrame().getHeight(requiredHeight: 44))
                        .foregroundColor(generalInfo.colorName == "green" ? greenColor : redColor)
                    Image(generalInfo.iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: getFrame().getWidth(requiredWidth: 24))
                }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 76),  alignment: .center)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(generalInfo.colorName == "green" ? greenColor : redColor, lineWidth: 2)
                        .background(generalInfo.colorName == "green" ? .green : .red)
                    HStack {
                        VStack {
                            Text("TYPE")
                                .font(.system(size: getFrame().getHeight(requiredHeight: 12)))
                            Text(generalInfo.type)
                                .fontWeight(.bold)
                        }.frame(width: getFrame().getWidth(requiredWidth: 115.34), alignment: .center)
                        
                        VStack {
                            Text("AMOUNT")
                                .font(.system(size: getFrame().getHeight(requiredHeight: 12)))
                            Text(generalInfo.amount)
                                .fontWeight(.bold)
                        }.frame(width: getFrame().getWidth(requiredWidth: 115.34), alignment: .center)
                        
                        VStack {
                            Text("STATUS")
                                .font(.system(size: getFrame().getHeight(requiredHeight: 12)))
                            Text(generalInfo.status)
                                .fontWeight(.bold)
                        }.frame(width: getFrame().getWidth(requiredWidth: 115.34), alignment: .center)
                    }
                }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 72), alignment: .center)
                
                VStack {
                    ForEach(info) { info_single in
                        HStack {
                            Text(info_single.name)
                                .font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                                .foregroundStyle(.white)
                                .frame(width: getFrame().getWidth(requiredWidth: 170), alignment: .leading)
                            Text(info_single.id)
                                .foregroundStyle(.white)
                                .frame(width: getFrame().getWidth(requiredWidth: 170), alignment: .leading)
                        }.padding()
                        if(info_single.name != "TRANSACTION HASH") {
                            Divider()
                                .background(Color(red: 60/255, green: 60/255, blue: 60/255))
                        }
                    }
                }.frame(width: getFrame().getWidth(requiredWidth: 390), alignment: .center)
                .background(.black)
            }.frame(width: getFrame().getWidth(requiredWidth: 390), height: getFrame().getHeight(requiredHeight: 984), alignment: .top)
        }.frame(width: getFrame().getWidth(requiredWidth: 390), alignment: .top)
            .background(Color.black)
    }
}

#Preview {
    ScrollView {
        VStack {
            SingleActivityView(info: infos[1], generalInfo: generalInfos[1])
            SingleActivityView(info: infos[2], generalInfo: generalInfos[2])
        }
    }
}
