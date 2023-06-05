//
//  ProductDetailsViewController.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    var product: Product?
    var productNameString: String?
    
    @IBOutlet weak var favoriuteButton: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productRatings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let productNameString = productNameString {
            title = productNameString
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let productInfo = product else {
            return
        }
    
        setupProductInfo(product: productInfo)
    }

    func setupProductInfo(product: Product) {
        productImageView.sd_setImage(with: URL(string: product.imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        productName.text = product.title
        productPrice.text = "\(product.price.first?.value ?? 0.0)"
        productRatings.text = String(format: "%.2f", product.ratingCount)
        
        if product.isAddToCartEnable {
            favoriuteButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            favoriuteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
    }
}
