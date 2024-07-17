//
//  Permission.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/21.
//

import SwiftUI

// Camera Permission Enum
enum Permission: String {
    case idle = "Not Determined"
    case approved = "Access Granted"
    case denied = "Access Denied"
}

let isGot: DispatchSemaphore = .init(value: 0)
