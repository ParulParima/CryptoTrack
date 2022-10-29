//
//  CryptoListEntity.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

struct CryptoListEntity {
    let cryptoBalance: CryptoBalanceEntity
    let cryptoHoldings: [CryptoHoldingEntity]
    let cryptoPrices: [CryptoPriceEntity]
    let allTransactions: [TransactionEntity]

}
