//
//  AccountView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/24.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        VStack(alignment: .center, spacing: getFrame().getHeight(requiredHeight: 20)) {
            
            ScrollView {
                AddMenuView()
                
                VStack(spacing: getFrame().getHeight(requiredHeight: 10)) {
                    Text("Activity")
                        .font(.system(size: getFrame().getWidth(requiredWidth: 30)))
                        .fontWeight(.black)
                        .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                    Text("Transactions of current account")
                        .font(.system(size: getFrame().getHeight(requiredHeight: 16)))
                        .frame(width: getFrame().getWidth(requiredWidth: 350), alignment: .leading)
                }
                VStack(spacing: 0.3) {
                    ForEach(0..<5) { index in
//                        Text(String(index))
                        SingleActivityView(info: infos[index], generalInfo: generalInfos[index])
                    }
                }
            }
        }
    }
}

#Preview {
    ActivityView()
}
