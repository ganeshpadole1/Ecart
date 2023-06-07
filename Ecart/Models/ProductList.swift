//
//  Products.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import Foundation

struct Constants {
    let baseURL = "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328"
}

class ProductList: Decodable {
    var products: [Product]
}

class Product: Decodable {
    let title: String
    let imageURL: String
    let ratingCount: Double
    var isAddToCartEnable: Bool // using this boolean value for favourite button
    let id: String
    let price: [Price]
}

class Price: Decodable {
    let value: Double
}
