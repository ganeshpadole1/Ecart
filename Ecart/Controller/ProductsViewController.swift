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
        fetchProducts()
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
        cell.setup(product)
        return cell
    }
    
    
}
