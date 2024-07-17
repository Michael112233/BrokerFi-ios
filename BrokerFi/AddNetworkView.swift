//
//  AddNetworkView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/15.
//

import SwiftUI

struct AddNetworkView: View {
    @State private var networkName :String = ""
    @State private var newRPCURL :String = ""
    @State private var chainID :String = ""
    @State private var currencySymbol :String = ""
    @State private var blockExplorerURL :String = ""
    @State private var selectNetworkClick = false
    @State private var saveClick = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Add a network")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Only add custom networks you trust")
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            VStack(spacing: 10) {
                Text("Network name")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                TextField("", text: $networkName)
                    .textFieldStyle(PasswordTextFieldStyle())
                
                Text("New RPC URL")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                TextField("", text: $newRPCURL)
                    .textFieldStyle(PasswordTextFieldStyle())
                
                Text("Chain ID")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                TextField("", text: $chainID)
                    .textFieldStyle(PasswordTextFieldStyle())
                
                Text("Currency symbol")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                TextField("", text: $currencySymbol)
                    .textFieldStyle(PasswordTextFieldStyle())
                
                Text("Block explorer URL (Optional)")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                TextField("", text: $blockExplorerURL)
                    .textFieldStyle(PasswordTextFieldStyle())
            }
            
            HStack(alignment: .center) {
                Button {
                    selectNetworkClick.toggle()
                } label: {
                    Text("Cancel")
                        .padding()
                        .frame(width: getFrame().getWidth(requiredWidth: 171),
                               height: getFrame().getHeight(requiredHeight: 44),alignment: .center)
                        .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                        .fontWeight(.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9999)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .foregroundColor(.black)
                }.fullScreenCover(isPresented: $selectNetworkClick, content: {
                    SelectNetworkView()
                })
                
                Button {
                    saveClick.toggle()
                } label: {
                    BlackButton(content: "Save", requiredWidth: 171, requiredHeight: 44)
                }.alert("Still developing.", isPresented: $saveClick) {
                    Button("Cancel", role: .cancel) {}
                }
            }
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 756), alignment: .top)
    }
}

#Preview {
    AddNetworkView()
}
