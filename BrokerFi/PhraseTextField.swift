//
//  PhraseTextField.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/14.
//

import SwiftUI

struct PhraseTextField: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    @State private var inputPhrases: String = ""
    
    var body: some View {
        TextField("", text: $inputPhrases)
            .padding(40)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 2)
            )
            .background(Color(red: 1, green: 1, blue: 0))
            .frame(width: screenWidth*0.9, height: screenHeight/844*104)
    }
}

#Preview {
    PhraseTextField()
}
