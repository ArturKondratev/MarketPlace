//
//  ProductDetailBuilder.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 22.01.2023.
//

import UIKit

class ProductDetailBuilder {
    static func build(product: ProductModel) -> UIViewController {
        let myCardSeaver = SaveService()
        let viewModel = ProductDetailViewModel(myCardSeaver: myCardSeaver)
        let viewController = DetailsMainViewController(product: product, viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}
