//
//  NetworkManager.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import Foundation

enum NetworkError: Error {
    case inValidURL
    case noData
    case jsonParsingError
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    init() {
    }
    
    func fetchProducts(url: String, completion: @escaping (Result<[Product]?, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.inValidURL))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.inValidURL))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let productList = try JSONDecoder().decode(ProductList.self, from: data)
            
                completion(.success(productList.products))
            } catch {
                completion(.failure(.jsonParsingError))
            }
            
        }.resume()
    }
}
