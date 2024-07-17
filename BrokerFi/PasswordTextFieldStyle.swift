//
//  TextFieldStyle.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/13.
//

import SwiftUI

struct PasswordTextFieldStyle: TextFieldStyle {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}
