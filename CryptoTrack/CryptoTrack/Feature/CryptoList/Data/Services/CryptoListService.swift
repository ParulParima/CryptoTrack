//
//  CryptoListService.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

class CryptoListService {
    
    func fetchCryptoListData(completion: @escaping (Result<CryptoListEntity, Error>) -> Void) {
        guard let url = URL(string: APIConstant.url) else { return }
        NetworkManager.shared.getApiData(requestURL: url, completionHandler: { (result : Result<CryptoListResponse, Error>) in completion(result.map {data in return data.asDomain()
            
        })
            
        })
    }
    
    
}
