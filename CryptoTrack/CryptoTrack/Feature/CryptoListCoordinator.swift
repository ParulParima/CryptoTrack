//
//  CryptoListCoordinator.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation
import UIKit

final class CryptoListCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    var sceneProvider: CryptoListSceneProvider
    private(set) var childCoordinator: [BaseCoordinator] = []
    
    init(navigationController: UINavigationController, sceneProvider: CryptoListSceneProvider) {
        self.navigationController = navigationController
        self.sceneProvider = sceneProvider
    }
    
    func start() {
    }
}
