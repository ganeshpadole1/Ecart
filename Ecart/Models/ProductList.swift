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

struct ProductList: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let title: String
    let imageURL: String
    let ratingCount: Double
    let price: [Price]
}

struct Price: Decodable {
    let value: Double
}
