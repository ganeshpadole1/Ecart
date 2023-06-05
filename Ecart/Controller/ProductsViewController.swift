//
//  ProductsViewController.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import UIKit

class ProductsViewController: UIViewController {

    var product = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchProducts()
    }
    
    func fetchProducts() {
        NetworkManager.shared.fetchProducts(url: Constants().baseURL) { result in
            switch result {
            case .success(let products):
                if let products = products {
                    self.product = products
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
