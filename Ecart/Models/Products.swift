//
//  Products.swift
//  Ecart
//
//  Created by Ganesh on 05/06/23.
//

import Foundation

struct Products: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let title: String
    let imageURL: String
    let price: [Price]
}

struct Price: Decodable {
    let value: Double
}
