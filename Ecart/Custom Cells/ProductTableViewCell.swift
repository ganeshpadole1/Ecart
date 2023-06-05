//
//  ProductTableViewCell.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var favoriuteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setup(_ product: Product) {
        productImageView.sd_setImage(with: URL(string: product.imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        productName.text = product.title
        productPrice.text = "Price: \(product.price.first?.value ?? 0.0)"
    }
}


