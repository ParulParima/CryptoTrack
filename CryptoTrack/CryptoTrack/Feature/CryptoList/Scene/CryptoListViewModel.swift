//
//  CryptoListViewModel.swift
//  CryptoTrack
//
//  Created by user229653 on 10/29/22.
//

import Foundation

class CryptoListViewModel {
    
    var cryptoData: CryptoListEntity?
    
    func fetchStockData(completion: @escaping () -> Void) {
        // fetching the data through api call
        CryptoListService().fetchCryptoListData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                    self.cryptoData = data
                completion()
            case let .failure(error):
                print(error)
                completion()
            }
        }
    }
    
}
