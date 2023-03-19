//
//  MenuModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 14.01.2023.
//

import UIKit

enum MenuModel: Int, CustomStringConvertible {
    case Orders
    case Favorites
    case Profile
    case Contacts
    case Settings
    case Support
    
    var description: String {
        switch self {
        case .Orders: return "My orders"
        case .Favorites: return "Favorites"
        case .Profile: return "Profile"
        case .Contacts: return "Contacts"
        case .Settings: return "Setting"
        case .Support: return "Support"
            
        }
    }
    
    var image: UIImage {
        switch self {
        case .Orders: return UIImage(systemName: "cart") ?? UIImage()
        case .Favorites: return UIImage(systemName: "heart") ?? UIImage()
        case .Profile: return UIImage(named: "Profile") ?? UIImage()
        case .Contacts: return UIImage(named: "Contacts") ?? UIImage()
        case .Settings: return UIImage(named: "Settings") ?? UIImage()
        case .Support: return UIImage(systemName: "message.and.waveform") ?? UIImage()
        }
    }
}

