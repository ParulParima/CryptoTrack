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
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
    
    
}
