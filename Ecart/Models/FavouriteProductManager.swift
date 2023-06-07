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
        
        
        let productIndex = favouriteProducts.firstIndex(where: {$0 === product})
        print("productIndex: \(productIndex)")
        
//        let product = favouriteProducts.index(where: { $0 === product })!
        favouriteProducts.remove(at: productIndex!)
    }
    
    func getAllFavouriteProducts() -> [Product] {
        return favouriteProducts
    }
}
