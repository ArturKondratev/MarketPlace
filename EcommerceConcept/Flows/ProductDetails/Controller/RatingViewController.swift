//
//  RatingViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class RatingViewController: UIViewController {
    
    // MARK: - Private Properties
    private var ratingView: RatingView {
        return self.view as! RatingView
    }
    var product: ProductModel {
        didSet{
            configureView()
        }
    }
    private let viewModel: ProductDetailViewModel
    
    // MARK: - LifeCycle
    init(product: ProductModel, viewModel: ProductDetailViewModel) {
        self.product = product
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = RatingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingView.delegate = self
        configureView()
    }
    
    func configureView() {
        DispatchQueue.main.async {
            self.ratingView.deviceNameLable.text = self.product.title
            self.ratingView.ratingStarView.value = CGFloat(self.product.rating)
        }
    }
}

extension RatingViewController: RatingViewProtoco {
    func tabLikeButton() {
        viewModel.likeButtonAction(model: self.product)
    }
}
