//
//  ShowPrivateKeyAfterConfirmView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/16.
//

import SwiftUI

struct ShowPrivateKeyAfterConfirmView: View {
    @State private var doneClick :Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            AddMenuView()
            
            VStack(spacing: 10) {
                Text("Show private key")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 30)))
                    .fontWeight(.black)
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                Text("Explain what is private key here")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 18)))
                    .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
            }
            
            VStack(alignment: .center, spacing: 10) {
                Text("261d8bfd483f5f96e89cc733f0526ddcb1a7490ae309e7495d8dd39456b2d795")
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: getFrame().getWidth(requiredWidth: 328), height: 48)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .lineSpacing(5)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 68))
                    )
                    
                    
            }.frame(width: getFrame().getWidth(requiredWidth: 350))
            
            WarningText()
            
            Button {
                doneClick.toggle()
            } label: {
                BlackButton(content: "Done", requiredWidth: 350, requiredHeight: 44)
            }.alert("Still developing.", isPresented: $doneClick) {
                Button("Cancel", role: .cancel) {}
            }
            
        }.frame(width: getFrame().getWidth(requiredWidth: 350), height: getFrame().getHeight(requiredHeight: 750), alignment: .top)
    }
}

#Preview {
    ShowPrivateKeyAfterConfirmView()
}
