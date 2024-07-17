//
//  SecretPhraseShow.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct SecretPhraseShow: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        Text("cancel cannon sport sustain rail rabbit antenna trigger south relief depend\n become")
            .frame(width: screenWidth*0.9, height: screenHeight/844*104, alignment: .center)
            .background(Color(red: 1.0, green: 1.0, blue: 0.0))
            .cornerRadius(8)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    SecretPhraseShow()
}
