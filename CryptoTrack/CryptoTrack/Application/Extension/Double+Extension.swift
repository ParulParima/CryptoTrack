//
//  Double+Extension.swift
//  CryptoTrack
//
//  Created by user229653 on 10/29/22.
//

import Foundation


public extension Double {
    /// SwiftRandom extension
    static func random(lower: Double = 0, upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}
