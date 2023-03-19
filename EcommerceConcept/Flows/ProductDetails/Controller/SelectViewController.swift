//
//  SelectViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class SelectViewController: UIViewController {

    // MARK: - Properties
    private var selectView: SelectView {
        return self.view as! SelectView
    }
    var product: ProductModel?
    
    // MARK: - LifeCycle
    init(product: ProductModel) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = SelectView()
    }
}
