//
//  getFrame.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/21.
//

import Foundation
import SwiftUI

class getFrame {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    
    func getWidth(requiredWidth: CGFloat) -> CGFloat {
        return screenWidth/390*requiredWidth
    }
    
    func getHeight(requiredHeight: CGFloat) -> CGFloat {
        return screenHeight/844*requiredHeight
    }
}
