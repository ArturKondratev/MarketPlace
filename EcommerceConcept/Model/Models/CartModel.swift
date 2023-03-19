//
//  CartModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 28.02.2023.
//

import Foundation

struct CartModel: Codable, Equatable {
    let product: ProductModel
    var count: Int
}
