//
//  File.swift
//  BrokerFi
//
//  Created by Michael233 on 2024/4/5.
//

import Foundation

struct WalletState: Codable {
    var Val: Int;
}

struct ReturnAccountState: Codable {
    var account: String;
    var balance: String;
}

struct ReceiveMessage: Codable {
    var message: String;
}

struct InputTransaction: Codable {
    var from: String;
    var to: String;
    var value: UInt64;
}
