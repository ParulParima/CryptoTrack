//
//  CryptoListResponse.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

struct CryptoListResponse: Codable {
    let cryptoBalance: CryptoBalanceResponse
    let cryptoHoldings: [CryptoHoldingResponse]
    let cryptoPrices: [CryptoPriceResponse]
    let allTransactions: [TransactionResponse]
    
    enum CodingKeys: String, CodingKey {
        case cryptoBalance = "crypto_balance"
        case cryptoHoldings = "your_crypto_holdings"
        case cryptoPrices = "crypto_prices"
        case allTransactions = "all_transactions"
        
    }
}

extension CryptoListResponse: DomainConvertableType {
    func asDomain() -> CryptoListEntity {
        return CryptoListEntity(cryptoBalance: cryptoBalance.asDomain(), cryptoHoldings: cryptoHoldings.map{ $0.asDomain() }, cryptoPrices: cryptoPrices.map { $0.asDomain()}, allTransactions: allTransactions.map {$0.asDomain() })
    }
}

