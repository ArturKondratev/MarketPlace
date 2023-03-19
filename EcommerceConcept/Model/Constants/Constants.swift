//
//  Constants.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 30.12.2022.
//

import UIKit

struct Constants {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat = 20
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 5)) / 4
    
    static let galleryBestSellerWidth = (UIScreen.main.bounds.width - 32.0) / 2
    
    
    
}
