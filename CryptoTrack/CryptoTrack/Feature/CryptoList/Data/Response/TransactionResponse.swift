//
//  TransactionResponse.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

struct TransactionResponse: Codable {
    let transactionLogo: String
    let title: String
    let transactionTime: String
    let transactionAmount: String
    let transactionSubAmount: String
    
    enum CodingKeys: String, CodingKey {
        case transactionLogo = "txn_logo"
        case title
        case transactionTime = "txn_time"
        case transactionAmount = "txn_amount"
        case transactionSubAmount = "txn_sub_amount"
    }
}

extension TransactionResponse: DomainConvertableType {
    func asDomain() -> TransactionEntity {
        return TransactionEntity(transactionLogo: transactionLogo, title: title, transactionTime: transactionTime, transactionAmount: transactionAmount, transactionSubAmount: transactionSubAmount)
    }
}

