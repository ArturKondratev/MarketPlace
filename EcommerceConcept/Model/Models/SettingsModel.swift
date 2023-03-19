//
//  SettingsModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

enum SettingsModel: Int, CustomStringConvertible {
    case Orders
    case Returns
    case Coupons
    case Favorites
    case DeliveryAddress
    case Settings
    
    var description: String {
        switch self {
        case .Orders: return "My orders"
        case .Returns: return "Returns"
        case .Coupons: return "Coupons"
        case .Favorites: return "Favorites"
        case .DeliveryAddress: return "Delivery address"
        case .Settings: return "Settings"
        }
    }

    var image: String {
        switch self {
        case .Orders: return "cart"
        case .Returns: return "arrow.uturn.left"
        case .Coupons: return "rectangle.on.rectangle"
        case .Favorites: return "heart"
        case .DeliveryAddress: return "homekit"
        case .Settings: return "slider.horizontal.3"
        }
    }
}


