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
        let viewController = sceneProvider.makeCryptoListScene()
        viewController.navigator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showCryptoDetails(cryptoPrice: CryptoPriceEntity, cryptoHolding: CryptoHoldingEntity) {
        let viewController = sceneProvider.makeCryptoDetailsScene(cryptoPrice: cryptoPrice, cryptoHolding: cryptoHolding)
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: true)
    }
}
