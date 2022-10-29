//
//  AppCoordinator.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow
    private(set) var childCoordinator: [BaseCoordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //initialization of navigation controller and integrating it with window
        let navigationController = UINavigationController()
        
        // integrating the app coordinator with the feature specific landing page ,i.e, CryptoList
        let sceneProvider = CryptoListSceneProvider()
        let cryptoListCoordinator  = CryptoListCoordinator(navigationController: navigationController, sceneProvider: sceneProvider)
        childCoordinator.append(cryptoListCoordinator)
        cryptoListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
    
    
}
