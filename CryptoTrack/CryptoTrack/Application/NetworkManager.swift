//
//  NetworkManager.swift
//  CryptoTrack
//
//  Created by ParulParima on 10/29/22.
//

import Foundation

//This class will contains all the core api call contents
public class NetworkManager {
    
    public static let shared = NetworkManager()
    
    func getApiData<T: Codable>(requestURL: URL, completionHandler: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: requestURL) { (responseData, serviceResponse, error) in
            if (error == nil && responseData != nil) {
                let decoder = JSONDecoder()
                do
                {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(.success(result))
                }
                catch let error {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}

