//
//  SelectAccountView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct SelectAccountView: View {
    @State private var isClick = false
    @State private var clickPos = -1
    @State private var isImported :Bool = false
    @State private var isAdded :Bool = false
    @State private var showDetailClick = false
    
    var body: some View {
        VStack(spacing: 20) {
            AddMenuView()
            
            VStack(alignment: .center) {
                Text("Select an account")
                    .font(.system(size: getFrame().getWidth(requiredWidth: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 36),  alignment: .leading)
                Text("Explain what is an account here")
                    .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 24), alignment: .leading)
                
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
                        AccountListView(accountName: "Account1", accountKey: "0x7135B24d2387A6Eb17d810bE19ECE92B8a8a3263")
                        
                        HStack(spacing: 0) {
                            Text("1 BKC").font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                                .frame(width: getFrame().getWidth(requiredWidth: 40), alignment: .trailing)
                            if (isClick && clickPos == 1) {
                                Image("check")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: getFrame().getWidth(requiredWidth: 40), height: getFrame().getHeight(requiredHeight: 16))
                            }
                        }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .trailing)
                        
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 80))
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
                        AccountListView(accountName: "Account2", accountKey: "0x8bCa141F8C02c33CD07ccc35D4201F348129eA8E")
                        
                        HStack(spacing: 0) {
                            Text("0 BKC").font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                                .frame(width: getFrame().getWidth(requiredWidth: 40), alignment: .trailing)
                            if (isClick && clickPos == 2) {
                                Image("check")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: getFrame().getWidth(requiredWidth: 40), height: getFrame().getHeight(requiredHeight: 16))
                            }
                        }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .trailing)
                        
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 80))
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
                        AccountListView(accountName: "Account3", accountKey: "0x917b1E3382a6BFd0526B93AF296c58316F8f9970")
                        
                        HStack(spacing: 0) {
                            Text("0 BKC").font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                                .frame(width: getFrame().getWidth(requiredWidth: 40), alignment: .trailing)
                            if (isClick && clickPos == 2) {
                                Image("check")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: getFrame().getWidth(requiredWidth: 40), height: getFrame().getHeight(requiredHeight: 16))
                            }
                        }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .trailing)
                        
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 80))
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
                        AccountListView(accountName: "Account4", accountKey: "0x85cD5459Ed2B59a63750cFb84f9FA639831eb7f6")
                        
                        HStack(spacing: 0) {
                            Text("0 BKC").font(.system(size: getFrame().getHeight(requiredHeight: 14)))
                                .frame(width: getFrame().getWidth(requiredWidth: 40), alignment: .trailing)
                            if (isClick && clickPos == 2) {
                                Image("check")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: getFrame().getWidth(requiredWidth: 40), height: getFrame().getHeight(requiredHeight: 16))
                            }
                        }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .trailing)
                        
                    }.frame(width: getFrame().getWidth(requiredWidth: 382), height: getFrame().getHeight(requiredHeight: 80))
                        .foregroundColor(.black)
                }
            }
            
            Button {
                isAdded.toggle()
            } label: {
                VStack(alignment: .center) {
                    BlackButton(content: "Add account", requiredWidth: 350, requiredHeight: 40)
                }
            }.fullScreenCover(isPresented: $isAdded) {
                AddAccountView()
            }
            
            Button {
                showDetailClick.toggle()
            } label: {
                VStack(alignment: .center) {
                    BlackButton(content: "Show chosen account", requiredWidth: 350, requiredHeight: 40)
                }
            }.fullScreenCover(isPresented: $showDetailClick) {
                MyAccountView()
            }
            
            Button {
                isImported.toggle()
            } label: {
                HStack {
                    Image("import")
                        .resizable()
                        .scaledToFit()
                        .frame(width: getFrame().getWidth(requiredWidth: 14))
                        .foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
                        .opacity(0.5)
                    Text("Import account")
                        .foregroundColor(Color(red: 107/255, green: 114/255, blue: 128/255))
                }
            }.alert("Still developing", isPresented: $isImported) {
                Button("Cancel", role: .cancel){
                }
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    SelectAccountView()
}
