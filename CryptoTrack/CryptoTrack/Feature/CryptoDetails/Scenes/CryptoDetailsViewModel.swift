//
//  CryptoDetailsViewModel.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/30/22.
//

import Foundation

class CryptoDetailsViewModel {
    
    let cryptoPrice: CryptoPriceEntity
    let cryptoHolding: CryptoHoldingEntity
    
    init(cryptoPrice: CryptoPriceEntity, cryptoHolding: CryptoHoldingEntity) {
        self.cryptoPrice = cryptoPrice
        self.cryptoHolding = cryptoHolding
    }
}
