//
//  FavouritesViewController.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    var favouriteProducts = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favourites"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getFavouriteProducts()
    }
    
    func getFavouriteProducts() {
        let products = FavouriteProductManager.shared.favouriteProducts
        favouriteProducts = products
        print(favouriteProducts.count)
    }
}
