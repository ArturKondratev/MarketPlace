//
//  ProductDetailViewModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 22.01.2023.
//

import UIKit

class ProductDetailViewModel {
    
    // MARK: - Properties
    var myCartSeaver: MyCardSaverProtocol
    weak var viewController: UIViewController?
    
    //MARK: - Init
    init(myCardSeaver: MyCardSaverProtocol) {
        self.myCartSeaver = myCardSeaver
    }
    
    //MARK: - Functions
    func addToCartToProduct(_ model: ProductModel) {
        let saveModel = CartModel(product: model, count: 1)
        myCartSeaver.addProductToCard(product: saveModel)
    }
    
    func tabCartButton() {
        let myCartVC = MyCartBuilder.build()
        viewController?.navigationController?.pushViewController(myCartVC, animated: true)
    }
    
    func tabToImage(screenShots: [String], indexPath: IndexPath) {
        let fullScreen = FullScreenViewController(screenShots: screenShots, indexPath: indexPath)
        viewController?.navigationController?.pushViewController(fullScreen, animated: true)
    }
    
    func likeButtonAction(model: ProductModel) {
        myCartSeaver.addFavoriteProduct(product: model)
    }
}
