//
//  ProductType.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 28.02.2023.
//

import Foundation

enum ProductType: Codable, Equatable {
    case Phones
    case Computer
    case Health
    case Books
    case PlayStation
    case Xbox
}

struct DeviceTypeModel {
    let name: String
    let icon: String
    let type: ProductType
}
