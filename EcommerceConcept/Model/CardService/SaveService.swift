//
//  SaveService.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 20.01.2023.
//

import Foundation

protocol MyCardSaverProtocol {
    func addProductToCard(product: CartModel)
    func getProductsForCard() -> [CartModel]
    func plusProductToCard(product: CartModel) -> Bool
    func minusProductInCard(product: CartModel) -> Bool
    func deleteProductInCard(product: CartModel) -> Bool
    func clearCart()
    
    func getFavoriteProduct() -> [ProductModel]
    func addFavoriteProduct(product: ProductModel)
    func deleteFavoriteProduct(product: ProductModel)
}

class SaveService: MyCardSaverProtocol {
    
    // MARK: - Properties
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let keyCard = "myCard"
    private let keyFavorite = "myFavorite"
    
    //MARK: - Favorites
    func getFavoriteProduct() -> [ProductModel] {
        guard let data = UserDefaults.standard.data(forKey: self.keyFavorite) else {
            return []
        }
        do {
            return try decoder.decode([ProductModel].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func addFavoriteProduct(product: ProductModel) {
        var favorites = getFavoriteProduct()
        if !favorites.contains(product) {
            favorites.append(product)
        }
        do {
            let data = try encoder.encode(favorites)
            UserDefaults.standard.set(data, forKey: self.keyFavorite)
        } catch {
            return
        }
    }
    
    func deleteFavoriteProduct(product: ProductModel) {
        var favorite = getFavoriteProduct()
        guard let index = favorite.firstIndex(where: {$0.title == product.title}) else { return }
        favorite.remove(at: index)
        do {
            let data = try encoder.encode(favorite)
            UserDefaults.standard.set(data, forKey: self.keyFavorite)
        } catch {
            return
        }
    }
    
    func getProductsForKey(key: String) -> [CartModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([CartModel].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    //MARK: - Card
    func getProductsForCard() -> [CartModel] {
        return getProductsForKey(key: self.keyCard)
    }
    
    func addProductToCard(product: CartModel) {
        do {
            var list = self.getProductsForCard()
            
            if !list.contains(product) {
                list.append(product)
            } else {
                if self.plusProductToCard(product: product) {
                }
            }
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: self.keyCard)
        } catch {
            print(error)
        }
    }
    
    func plusProductToCard(product: CartModel) -> Bool  {
        do {
            var list = self.getProductsForCard()
            guard let index = list.firstIndex(where: {$0.product.title == product.product.title }) else { return false}
            
            var prod = list[index]
            list.remove(at: index)
            prod.count += 1
            list.insert(prod, at: index)
            
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: self.keyCard)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func minusProductInCard(product: CartModel) -> Bool  {
        do {
            var list = self.getProductsForCard()
            guard let index = list.firstIndex(where: {$0.product.title == product.product.title }) else { return false}
            
            var prod = list[index]
            
            if prod.count == 1 {
                list.remove(at: index)
            } else {
                list.remove(at: index)
                prod.count -= 1
                list.insert(prod, at: index)
            }
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: self.keyCard)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func deleteProductInCard(product: CartModel) -> Bool {
        do {
            var list = self.getProductsForCard()
            guard let index = list.firstIndex(where: {$0.product.title == product.product.title }) else { return false}
            list.remove(at: index)
            
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: self.keyCard)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func clearCart() {
        let products: [CartModel] = []
        do {
            let data = try encoder.encode(products)
            UserDefaults.standard.set(data, forKey: self.keyCard)
        } catch {
            print(error)
        }
    }
    

    func saveDeliveryAddress(address: AddressModel) {
        do {
            let data = try encoder.encode(address)
            UserDefaults.standard.set(data, forKey: "deliveryAddress")
        } catch {
           print(error)
        }
    }
    
    func getDeliveryAddress() -> AddressModel? {
        guard let data = UserDefaults.standard.data(forKey: "deliveryAddress") else {
            return nil
        }
        do {
            return try decoder.decode(AddressModel.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
