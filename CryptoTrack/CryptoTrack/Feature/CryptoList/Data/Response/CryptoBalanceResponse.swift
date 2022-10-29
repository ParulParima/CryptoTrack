//
//  CryptoBalanceResponse.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

struct CryptoBalanceResponse: Codable {
    let title: String
    let subtitle: String
    let currentBalanceInUSD: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case currentBalanceInUSD = "current_bal_in_usd"
    }
}

extension CryptoBalanceResponse: DomainConvertableType {
    func asDomain() -> CryptoBalanceEntity {
        return CryptoBalanceEntity(title: title, subtitle: subtitle, currentBalanceInUSD: currentBalanceInUSD)
    }
}
