//
//  DomainConvertableType.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

// common protocol which will help in mapping the data from response to entity
protocol DomainConvertableType {
    associatedtype DomainType
    func asDomain() -> DomainType
}
