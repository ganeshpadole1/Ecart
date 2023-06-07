//
//  ProductsViewController.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import UIKit

class ProductsViewController: UIViewController {
    
    var products: [Product] = [] {
        didSet {
            productTableView.reloadData()
        }
    }
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Products"
        productTableView.rowHeight = 125
        productTableView.estimatedRowHeight = UITableView.automaticDimension
        
        fetchProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func fetchProducts() {
        NetworkManager.shared.fetchProducts(url: Constants().baseURL) { result in
            switch result {
            case .success(let products):
                if let products = products {
                    self.products = products
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        let product = products[indexPath.row]
        
        cell.buttonPressed = {
            product.isAddToCartEnable.toggle()
            self.updateCell(cell, product: product, isButtonPressed: true)
        }
        
        self.updateCell(cell, product: product, isButtonPressed: false)
        
        cell.setup(product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let productDetailsVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        productDetailsVC.product = product
        productDetailsVC.productNameString = product.title
        self.navigationController?.pushViewController(productDetailsVC, animated: true)
    }
    
    func updateCell(_ cell: ProductTableViewCell, product: Product, isButtonPressed: Bool) {
        if product.isAddToCartEnable {
            cell.favoriuteButton.setImage(UIImage(systemName: "star"), for: .normal)
            if isButtonPressed {
                FavouriteProductManager.shared.removeFavourite(product)
            }
        } else {
            cell.favoriuteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            if isButtonPressed {
                FavouriteProductManager.shared.addFavourite(product)
            }
        }
    }
}
