//
//  MainScenViewModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 19.01.2023.
//

import UIKit

class MainScenViewModel {
    
    // MARK: - Observable properties
    var allCategory = Observable<[DeviceTypeModel]>([])
    var countInCard = Observable<Int>(0)
    var countFavorites = Observable<Int>(0)
    var hotSales = Observable<[ProductModel]>([])
    var bestSeller = Observable<[ProductModel]>([])
    
    // MARK: - Properties
    weak var viewController: UIViewController?
    let appDataService: AppDataServiceProtocol
    let saveService: MyCardSaverProtocol
    
    var selectProductType: ProductType = .Phones {
        didSet{
            loadData()
        }
    }
    
    // MARK: - Init
    init(appDataService: AppDataServiceProtocol, saveService: MyCardSaverProtocol) {
        self.appDataService = appDataService
        self.saveService = saveService
    }
    
    //MARK: - ButtonActions
    func didSelectCategiry(type: ProductType) {
        selectProductType = type
    }
    
    func didSelectItem(product: ProductModel) {
        let myCartVC = ProductDetailBuilder.build(product: product)
        viewController?.navigationController?.pushViewController(myCartVC, animated: true)
    }
    
    func tabCartButton() {
        let myCartVC = MyCartBuilder.build()
        viewController?.navigationController?.pushViewController(myCartVC, animated: true)
    }
    
    func tabPersonButton() {
        let personalAccountVC = PersonalAccountVC()
        personalAccountVC.view.backgroundColor = .mainBackgroundColor
        viewController?.navigationController?.pushViewController(personalAccountVC, animated: true)
    }
    
    func tabHeartButton() {
        let vc = FavoriteViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func mainScenViewDidLoad() {
        loadData()
        allCategory.value = appDataService.getDateForSelectCategory()
        countInCard.value = saveService.getProductsForCard().count
        countFavorites.value = saveService.getFavoriteProduct().count
    }
    
    func loadData() {
        switch selectProductType {
        case .Phones:
            let phones = appDataService.getPhones()
            hotSales.value = phones.filter({$0.hotSales == true})
            bestSeller.value = phones.filter({$0.hotSales == false})
        case .Computer:
            let computers = appDataService.getComputers()
            hotSales.value = computers.filter({ $0.hotSales == true})
            bestSeller.value = computers.filter({ $0.hotSales == false})
        case .Health:
            hotSales.value = []
            bestSeller.value = []
        case .Books:
            hotSales.value = []
            bestSeller.value = []
        case .PlayStation:
            hotSales.value = []
            bestSeller.value = []
        case .Xbox:
            hotSales.value = []
            bestSeller.value = []
        }
    }
    
    func searchBarAction(text: String) {
        var filtredHot = [ProductModel]()
        var filtredBest = [ProductModel]()
        
        if text == "" {
            loadData()
        } else {
            
            for i in hotSales.value {
                if i.title.lowercased().contains(text.lowercased()) {
                    filtredHot.append(i)
                }
            }
            
            for i in bestSeller.value {
                if i.title.lowercased().contains(text.lowercased()) {
                    filtredBest.append(i)
                }
            }
            self.hotSales.value = filtredHot
            self.bestSeller.value = filtredBest
        }
    }
}

