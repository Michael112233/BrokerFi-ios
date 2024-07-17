//
//  ActivityData.swift
//  BrokerFi
//
//  Created by Michael233 on 2023/10/26.
//

import Foundation

var infos = [
    [
        Line(name: "FEE", id: "0.01 BKC"),
        Line(name: "MODEL", id: "cross-shard-with-broker"),
        Line(name: "TIMESTAMP", id: "2023/10/24 23:10:58"),
        Line(name: "FROM ADDRESS", id: "0x7135b24d2387a6eb17d810be19ece92b8a8a3263"),
        Line(name: "TO ADDRESS", id: "0x7135b24d2387a6eb17d810be19ece92b8a8a3263"),
        Line(name: "SHARD ID", id: "6"),
        Line(name: "BLOCK HEIGHT", id: "798"),
        Line(name: "BLOCK HASH", id: "0x2544d8a7f8dfe117a3c2bafcf86a1d46fd949b4c"),
        Line(name: "TRANSACTION HASH", id: "0x89a79f1832825c8d99eeee45aaf63e03a6a31f2b")
    ],
    
    [
        Line(name: "FEE", id: "0.01 BKC"),
        Line(name: "MODEL", id: "in-shard"),
        Line(name: "TIMESTAMP", id: "2023/10/24 23:10:58"),
        Line(name: "FROM ADDRESS", id: "0x8bca141f8c02c33cd07ccc35d4201f348129ea8e"),
        Line(name: "TO ADDRESS", id: "0x8bca141f8c02c33cd07ccc35d4201f348129ea8e"),
        Line(name: "SHARD ID", id: "14"),
        Line(name: "BLOCK HEIGHT", id: "498"),
        Line(name: "BLOCK HASH", id: "0xa46fbb67f86f570f80b39fb964b63438b32564ae"),
        Line(name: "TRANSACTION HASH", id: "0xa6a276e2ba8f8f5e9a71fd0c2d7d021bc1d688ed")
    ],
    
    [
        Line(name: "FEE", id: "0.01 BKC"),
        Line(name: "MODEL", id: "cross-shard-without-broker"),
        Line(name: "TIMESTAMP", id: "2023/10/24 23:10:58"),
        Line(name: "FROM ADDRESS", id: "0x917b1e3382a6bfd0526b93af296c58316f8f9970"),
        Line(name: "TO ADDRESS", id: "0x917b1e3382a6bfd0526b93af296c58316f8f9970"),
        Line(name: "SHARD ID", id: "10"),
        Line(name: "BLOCK HEIGHT", id: "346"),
        Line(name: "BLOCK HASH", id: "0xd5da447fd68a2b2cbdb4637dfc88732fc72e410c"),
        Line(name: "TRANSACTION HASH", id: "0xee61853078d917094c8b95b414ae2a414677d03c")
    ],
    
    [
        Line(name: "FEE", id: "0.01 BKC"),
        Line(name: "MODEL", id: "in-shard"),
        Line(name: "TIMESTAMP", id: "2023/10/24 23:10:58"),
        Line(name: "FROM ADDRESS", id: "0x85cd5459ed2b59a63750cfb84f9fa639831eb7f6"),
        Line(name: "TO ADDRESS", id: "0x85cd5459ed2b59a63750cfb84f9fa639831eb7f6"),
        Line(name: "SHARD ID", id: "9"),
        Line(name: "BLOCK HEIGHT", id: "799"),
        Line(name: "BLOCK HASH", id: "0x94a012825920a880c28c6a1e34aacf5e90f566cd"),
        Line(name: "TRANSACTION HASH", id: "0x537b89ee597a893509aad207c69eef2caafd6ccb")
    ],
    
    [
        Line(name: "FEE", id: "0.01 BKC"),
        Line(name: "MODEL", id: "in-shard"),
        Line(name: "TIMESTAMP", id: "2023/10/24 23:10:58"),
        Line(name: "FROM ADDRESS", id: "0x85cd5459ed2b59a63750cfb84f9fa639831eb7f6"),
        Line(name: "TO ADDRESS", id: "0x85cd5459ed2b59a63750cfb84f9fa639831eb7f6"),
        Line(name: "SHARD ID", id: "8"),
        Line(name: "BLOCK HEIGHT", id: "882"),
        Line(name: "BLOCK HASH", id: "0xf9077e8767ee17d0b0512a5df83f6e5fe29ffb55"),
        Line(name: "TRANSACTION HASH", id: "0x606f5cf5cbbfe2928dceb84c5c2e8834e9d64c70")
    ]
]


struct GeneralInfo {
    let type: String
    let amount: String
    let status: String
    let colorName: String
    let iconName: String
}

func getGeneralInfo(type: String, amount: String, status: String) -> GeneralInfo {
    var iconName = "", colorName = "green"
    if(type == "RECEIVE") {
        iconName = "smile"
    }
    if(type == "PROFIT") {
        iconName = "cloud-sync"
    }
    if(type == "SEND") {
        iconName = "send"
        colorName = "red"
    }
    if(type == "STAKE") {
        iconName = "cloud-upload"
    }
    if(type == "WITHDRAW") {
        iconName = "cloud-download"
    }
    return GeneralInfo(type: type, amount: amount, status: status, colorName: colorName, iconName: iconName)
}

var generalInfos = [
    getGeneralInfo(type: "RECEIVE", amount: "+ 1 BKC", status: "PENDING"),
    getGeneralInfo(type: "PROFIT", amount: "+ 0.1 BKC", status: "PENDING"),
    getGeneralInfo(type: "SEND", amount: "- 2 BKC", status: "PENDING"),
    getGeneralInfo(type: "STAKE", amount: "- 10 BKC", status: "PENDING"),
    getGeneralInfo(type: "WITHDRAW", amount: "+ 0.2 BKC", status: "PENDING"),
]
