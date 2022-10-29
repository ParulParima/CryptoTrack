
//
//  CryptoListSceneProvider.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation
import UIKit

class CryptoListSceneProvider {
    func makeCryptoListScene() -> CryptoListViewController {
        let viewModel = CryptoListViewModel()
        let  controller = CryptoListViewController(viewModel: viewModel)
        return controller
    }
    func makeCryptoDetailsScene(cryptoPrice: CryptoPriceEntity, cryptoHolding: CryptoHoldingEntity) -> CryptoDetailsViewController {
        let viewModel = CryptoDetailsViewModel(cryptoPrice: cryptoPrice, cryptoHolding: cryptoHolding)
        let controller = CryptoDetailsViewController(viewModel: viewModel)
        return controller
    }
}
