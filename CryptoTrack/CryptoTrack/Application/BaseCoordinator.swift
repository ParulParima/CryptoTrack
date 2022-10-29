//
//  BaseCoordinator.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

protocol BaseCoordinator: AnyObject {
    var childCoordinator: [BaseCoordinator] {get}
    func start()
}
