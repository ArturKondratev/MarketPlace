//
//  MyCartViewModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 22.01.2023.
//

import Foundation
import UIKit

class MyCartViewModel {
    // MARK: - Observable properties
    var productInCart = Observable<[CartModel]>([])
    var totalCost = Observable<Int>(0)
    
    // MARK: - Properties
    var myCartSaver: MyCardSaverProtocol
    weak var viewController: UIViewController?
    
    // MARK: - Init
    init(myCardSeaver: MyCardSaverProtocol) {
        self.myCartSaver = myCardSeaver
    }
    
    // MARK: - Functions
    func loadData() {
        let allProdocts = myCartSaver.getProductsForCard()
        productInCart.value = allProdocts
        
        var total = 0
        for i in allProdocts {
            total += (i.count * i.product.discounPrice)
        }
        totalCost.value = total
    }
    
    func plusProduct(product: CartModel) {
        if myCartSaver.plusProductToCard(product: product) {
            loadData()
        }
    }
    
    func minusProduct(product: CartModel) {
        if myCartSaver.minusProductInCard(product: product) {
            loadData()
        }
    }
    
    func deleteProduct(product: CartModel) {
        if myCartSaver.deleteProductInCard(product: product) {
            productInCart.value = myCartSaver.getProductsForCard()
        }
        loadData()
    }
    
    func bacwardButtonAction() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func didTapLocationButton() {
        let mapVC = AddressViewController()
        viewController?.navigationController?.pushViewController(mapVC, animated: true)
    }
}
