//
//  AppDataService.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 19.01.2023.
//

import Foundation

protocol AppDataServiceProtocol: AnyObject {
    func getDateForSelectCategory() -> [DeviceTypeModel]
    func getPhones() -> [ProductModel]
    func getComputers() -> [ProductModel]
}

class AppDataService: AppDataServiceProtocol {
    
    func getDateForSelectCategory() -> [DeviceTypeModel] {
        return [
            DeviceTypeModel(name: "Phone", icon: "iphone", type: .Phones),
            DeviceTypeModel(name: "Computer", icon: "desktopcomputer", type: .Computer),
            DeviceTypeModel(name: "Health", icon: "bolt.heart", type: .Health),
            DeviceTypeModel(name: "Books", icon: "books.vertical", type: .Books),
            DeviceTypeModel(name: "PlayStation", icon: "logo.playstation", type: .PlayStation),
            DeviceTypeModel(name: "Xbox", icon: "logo.xbox", type: .Xbox),
        ]
    }
    
    func getPhones() -> [ProductModel] {
        
        return [ ProductModel(type: .Phones,
                             id: 1,
                             title: "iPhone 14 Pro Max",
                             subtitle: "Super.Mega",
                             picture: ["iphone14-0", "iphone14-1", "iphone14-2", "iphone14-3"],
                             isNew: true,
                             hotSales: true,
                             isFavorites: false,
                             rating: 4.7,
                             discounPrice: 1599,
                             priceWithoutPrice: 2300),
                 
                 ProductModel(type: .Phones,
                             id: 2,
                             title: "Samsung Galaxy S22",
                             subtitle: "5G 8/128GB Phantom Black",
                             picture: ["s22-0", "s22-1", "s22-2", "s22-3"],
                             isNew: false,
                             hotSales: true,
                             isFavorites: false,
                             rating: 3.5,
                             discounPrice: 1370,
                             priceWithoutPrice: 1895),
                 
                 ProductModel(type: .Phones,
                             id: 3,
                             title: "HUAWEI Nova",
                             subtitle: "Nova the best",
                             picture: ["3"],
                             isNew: true,
                             hotSales: true,
                             isFavorites: false,
                             rating: 2.6,
                             discounPrice: 799,
                             priceWithoutPrice: 1299),
                 
                 ProductModel(type: .Phones,
                             id: 4,
                             title: "iPhone 13 ",
                             subtitle: "Mega.Best",
                             picture: ["22", "11", "33"],
                             isNew: false,
                             hotSales: false,
                             isFavorites: false,
                             rating: 4.5,
                             discounPrice: 1370,
                             priceWithoutPrice: 1895),
                 
                 ProductModel(type: .Phones,
                             id: 5,
                             title: "Samsung Galaxy A53",
                             subtitle: "8/128Gb Black ALG",
                             picture: ["33", "11", "22"],
                             isNew: false,
                             hotSales: false,
                             isFavorites: false,
                             rating: 3.8,
                             discounPrice: 370,
                             priceWithoutPrice: 499),
                 
                 ProductModel(type: .Phones,
                             id: 6,
                             title: "Xiaomi Redmi Note",
                             subtitle: "11S 6GB/128B Graphite Gray",
                             picture: ["11", "22", "33"],
                             isNew: false,
                             hotSales: false,
                             isFavorites: false,
                             rating: 4.6,
                             discounPrice: 299,
                             priceWithoutPrice: 410),
                 
                 ProductModel(type: .Phones,
                             id: 7,
                             title: "POCO F4 GT",
                             subtitle: "128GB Cyber Yellow",
                             picture: ["11"],
                             isNew: false,
                             hotSales: false,
                             isFavorites: false,
                             rating: 4.6,
                             discounPrice: 299,
                             priceWithoutPrice: 410),
                 
                 ProductModel(type: .Phones,
                             id: 8,
                             title: "ASUS Zenfone 8",
                             subtitle: "ZS590KS 8+256GB Black",
                             picture: ["s22-3"],
                             isNew: false,
                             hotSales: false,
                             isFavorites: false,
                             rating: 4.6,
                             discounPrice: 299,
                             priceWithoutPrice: 410),
        ]
    }
    
    func getComputers() -> [ProductModel] {
        return [
            ProductModel(type: .Computer,
                     id: 1,
                     title: "Apple MacBook Air M1",
                     subtitle: "10/16-core/32/1TB SpaceGray",
                     picture: ["mac1", "mac2", "mac3"],
                     isNew: true,
                     hotSales: true,
                     isFavorites: false,
                     rating: 5,
                     discounPrice: 3799,
                     priceWithoutPrice: 4500),
            
            ProductModel(type: .Computer,
                         id: 2,
                         title: "ASUS ROG Flow Z13",
                         subtitle: "GZ301ZE-LD226W",
                         picture: ["asus1", "asus2"],
                         isNew: false,
                         hotSales: true,
                         isFavorites: false,
                         rating: 4.6,
                         discounPrice: 2999,
                         priceWithoutPrice: 3450),
            
            ProductModel(type: .Computer,
                         id: 3,
                         title: "ASUS ROG" ,
                         subtitle: "GZ301ZE",
                         picture: ["asus2"],
                         isNew: false,
                         hotSales: false,
                         isFavorites: false,
                         rating: 4.0,
                         discounPrice: 2490,
                         priceWithoutPrice: 2830),
            
            ProductModel(type: .Computer,
                         id: 4,
                         title: "ASUS ROG" ,
                         subtitle: "GZ301ZE",
                         picture: ["asus3"],
                         isNew: false,
                         hotSales: false,
                         isFavorites: false,
                         rating: 4.6,
                         discounPrice: 2490,
                         priceWithoutPrice: 2830),
            
            ProductModel(type: .Computer,
                         id: 5,
                         title: "HUAWEI MateBook D 15" ,
                         subtitle: "BoM-WDQ9 серебристый",
                         picture: ["huawei1", "huawei2", "huawei3"],
                         isNew: false,
                         hotSales: false,
                         isFavorites: false,
                         rating: 4.1,
                         discounPrice: 2490,
                         priceWithoutPrice: 2830)
            
        ]
        
    }
    
}
