//
//  CongratulationView.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct CongratulationView: View {
    @State private var welcomeClicked = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("🥳")
                .font(.system(size: getFrame().getHeight(requiredHeight: 96)))
            
            VStack(spacing: 8) {
                Text("Congratulations!")
                    .font(.system(size: getFrame().getHeight(requiredHeight: 36)))
                    .fontWeight(.black)
                Text("You passed the test")
            }
            
            Button {
                welcomeClicked.toggle()
            } label: {
                BlackButton(content: "All done", requiredWidth: 160, requiredHeight: 40)
            }.fullScreenCover(isPresented: $welcomeClicked, content: {
                WelcomeBackView()
            })
        }
        
    }
}

#Preview {
    CongratulationView()
}
