//
//  FavouritesViewController.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    @IBOutlet weak var favouriteProductTableView: UITableView!
    var favouriteProducts = [Product]() {
        didSet {
            favouriteProductTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favourites"
        favouriteProductTableView.rowHeight = 125
        favouriteProductTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getFavouriteProducts()
    }
    
    func getFavouriteProducts() {
        
        favouriteProductTableView.dataSource = self
        favouriteProductTableView.delegate = self
        
        let products = FavouriteProductManager.shared.favouriteProducts
        favouriteProducts = products
    }
}

extension FavouritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteProductTableViewCell") as! FavouriteProductTableViewCell
        let product = favouriteProducts[indexPath.row]
        cell.buttonPressed = {
            self.updateCell(cell, indexPath: indexPath, product: product)
        }
        cell.setup(product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = favouriteProducts[indexPath.row]
        let productDetailsVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        productDetailsVC.product = product
        productDetailsVC.productNameString = product.title
        self.navigationController?.pushViewController(productDetailsVC, animated: true)
    }
    
    func updateCell(_ cell: FavouriteProductTableViewCell,indexPath: IndexPath, product: Product) {
        FavouriteProductManager.shared.removeFavourite(product)
        
        self.getFavouriteProducts()
    }
}
