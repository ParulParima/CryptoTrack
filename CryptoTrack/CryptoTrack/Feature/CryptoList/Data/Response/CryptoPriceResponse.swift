//
//  CryptoPriceResponse.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

struct CryptoPriceResponse: Codable {
    let logo: String
    let title: String
    let currentPriceInUSD:String
    
    enum CodingKeys: String, CodingKey {
        case logo
        case title
        case currentPriceInUSD = "current_price_in_usd"
    }
}

extension CryptoPriceResponse: DomainConvertableType {
    func asDomain() -> CryptoPriceEntity {
        return CryptoPriceEntity(logo: logo, title: title,  currentPriceInUSD: currentPriceInUSD)
    }
}
