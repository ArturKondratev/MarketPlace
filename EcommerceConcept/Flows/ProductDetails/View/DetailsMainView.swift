//
//  DetailsMainView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

protocol DetailsMainViewDelegete: AnyObject {
    func addToCart()
}

class DetailsMainView: UIView {

    weak var delegate: DetailsMainViewDelegete?
    
    //MARK: - SabViews
    var screenShotsView = ScreenShotsView()
    var nameRatingView = RatingView()
    var tabBarView = TabBarView()
    var selectColorView = SelectView()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .mainBackgroundColor
        return scrollView
    }()
    
    var whiteBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return view
    }()
    
    var addToCardButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandOrange
        button.tintColor = .white
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitle("Add to Cart  $1,500.00", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(addToCartAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCartButton()
        addScroleView()
      //  addWhiteBottomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addCartButton()
        addScroleView()
       // addWhiteBottomView()
    }
    
    @objc func addToCartAction() {
        delegate?.addToCart()
    }
    
    func addCartButton() {
        self.addSubview(addToCardButton)
        NSLayoutConstraint.activate([
            addToCardButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            addToCardButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            addToCardButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            addToCardButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    func addScroleView() {
        self.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: addToCardButton.topAnchor, constant: -8),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    func addWhiteBottomView() {
        self.scrollView.addSubview(whiteBottomView)
        NSLayoutConstraint.activate([
            whiteBottomView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            whiteBottomView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            whiteBottomView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            whiteBottomView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            whiteBottomView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}
