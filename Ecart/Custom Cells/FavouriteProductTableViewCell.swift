//
//  FavouriteProductTableViewCell.swift
//  Ecart
//
//  Created by Ganesh on 07/06/23.
//

import UIKit

class FavouriteProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var deleletProductButton: UIButton!
    
    var buttonPressed : (() -> ()) = {}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setup(_ product: Product) {
        productImage.sd_setImage(with: URL(string: product.imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        productName.text = product.title
        productPrice.text = "Price: \(product.price.first?.value ?? 0.0)"
    }
    
    @IBAction func deleteProductButtonPressed(_ sender: UIButton) {
        buttonPressed()
    }
}
