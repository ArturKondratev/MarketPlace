//
//  MainScenBuilder.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 19.01.2023.
//

import UIKit

final class MainScenBuilder {
    
    static func build() -> UIViewController {
        let appDataService = AppDataService()
        let cardService = SaveService()
        let viewModel = MainScenViewModel(appDataService: appDataService,
                                          saveService: cardService)
        let viewController = MainScenViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}
