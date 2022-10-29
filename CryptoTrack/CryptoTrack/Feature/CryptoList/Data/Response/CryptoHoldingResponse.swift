//
//  CryptoHoldingResponse.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

struct CryptoHoldingResponse: Codable {
    let logo: String
    let title: String
    let currentBalanceInToken: String
    let currentBalanceInUSD:String
    
    enum CodingKeys: String, CodingKey {
        case logo
        case title
        case currentBalanceInToken = "current_bal_in_token"
        case currentBalanceInUSD = "current_bal_in_usd"
    }
}

extension CryptoHoldingResponse: DomainConvertableType {
    func asDomain() -> CryptoHoldingEntity {
        return CryptoHoldingEntity(logo: logo, title: title, currentBalanceInToken: currentBalanceInToken, currentBalanceInUSD: currentBalanceInUSD)
    }
}
