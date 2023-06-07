//
//  FavouriteProductManager.swift
//  Ecart
//
//  Created by Ganesh on 07/06/23.
//

import Foundation


class FavouriteProductManager {
    
    static let shared = FavouriteProductManager()
    
    var favouriteProducts = [Product]()
    
    init() {
        
    }
    
    func addFavourite(_ product: Product) {
        favouriteProducts.append(product)
    }
    
    func removeFavourite(_ product: Product) {
        if let index = favouriteProducts.firstIndex(of: product) {
            favouriteProducts.remove(at: index)
        }
    }
    
    func getAllFavouriteProducts() -> [Product] {
        return favouriteProducts
    }
}
