//
//  SelectNetworkVIew.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct SelectNetworkView: View {
    @State private var isClick = false
    @State private var clickPos = -1
    @State private var addNetworkClick = false
    
    var body: some View {
        VStack() {
            VStack(alignment: .center) {
                AddMenuView()
                
                Text("Select a network")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 36),  alignment: .leading)
                Text("Explain what is a network here")
                    .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
                // main
                Button {
                    if !isClick {
                        isClick = true
                        clickPos = 1
                    } else {
                        isClick = false
                        clickPos = -1
                    }
                } label: {
                    ZStack {
                        NetworkListView(hasCircle: true, iconName: "sketch", text: "Main network")
                        
                        if (isClick && clickPos == 1) {
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 16), alignment: .trailing)
                        }
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 76))
                        .foregroundColor(.black)
                }
                
                Button {
                    if !isClick {
                        isClick = true
                        clickPos = 2
                    } else {
                        isClick = false
                        clickPos = -1
                    }
                } label: {
                    ZStack {
                        NetworkListView(hasCircle: true, iconName: "dribbble", text: "Third-party network")
                        
                        if (isClick && clickPos == 2) {
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 16), alignment: .trailing)
                        }
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 76))
                        .foregroundColor(.black)
                }
                
                Button {
                    if !isClick {
                        isClick = true
                        clickPos = 3
                    } else {
                        isClick = false
                        clickPos = -1
                    }
                } label: {
                    ZStack {
                        NetworkListView(hasCircle: true, iconName: "codepen", text: "Test network")
                        
                        if (isClick && clickPos == 3) {
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 16), alignment: .trailing)
                        }
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 76))
                        .foregroundColor(.black)
                }
                
                Button {
                    if !isClick {
                        isClick = true
                        clickPos = 4
                    } else {
                        isClick = false
                        clickPos = -1
                    }
                } label: {
                    ZStack {
                        NetworkListView(hasCircle: true, iconName: "reddit", text: "Local dev network")
                        
                        if (isClick && clickPos == 4) {
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 16), alignment: .trailing)
                        }
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 76))
                        .foregroundColor(.black)
                }
            }
            
            Button {
                addNetworkClick.toggle()
            } label: {
                VStack(alignment: .center) {
                    BlackButton(content: "Add network", requiredWidth: 350, requiredHeight: 40)
                }
            }.fullScreenCover(isPresented: $addNetworkClick, content: {
                AddNetworkView()
            })
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    SelectNetworkView()
}
