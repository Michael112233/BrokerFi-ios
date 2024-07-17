//
//  WithdrawView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/21.
//

import SwiftUI

struct WithdrawView: View {
    @State private var from :String = ""
    @State private var to :String = ""
    @State private var amount :String = ""
    
    var body: some View {
        VStack(spacing: getFrame().getHeight(requiredHeight: 16)) {
            AddMenuView()
            
            VStack {
                Text("Withdraw")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 36), alignment: .leading)
                Text("Transfer your coins securely back from broker system address")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 16)))
                    .lineSpacing(6)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Send from")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                TextField("", text: $from)
                    .textFieldStyle(PasswordTextFieldStyle())
                
                Text("Send to")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                TextField("", text: $to)
                    .textFieldStyle(PasswordTextFieldStyle())
                
                Text("Amount")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                TextField("0.00", text: $amount)
                    .textFieldStyle(PasswordTextFieldStyle())
            }.frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            
            BlackButton(content: "Withdraw", requiredWidth: 350, requiredHeight: 40)
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    WithdrawView()
}
