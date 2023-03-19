//
//  BestSellerColllectionView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 10.01.2023.
//

import UIKit

class BestSellerView: UIView {
    
    var heightCollectionView = NSLayoutConstraint()
    
    // MARK: - Subviews
    private(set) var bestSeller: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "Best seller"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private(set) var seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("see more", for: .normal)
        button.tintColor = .brandOrange
        return button
    }()
    
    private(set) var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
      //  collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .mainBackgroundColor
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: BestSellerCollectionViewCell.identifier)
        return collectionView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    // MARK: - UI
    private func setUI() {
        self.addSubview(bestSeller)
        self.addSubview(seeMoreButton)
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            bestSeller.topAnchor.constraint(equalTo: topAnchor),
            bestSeller.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
        
            seeMoreButton.centerYAnchor.constraint(equalTo: bestSeller.centerYAnchor),
            seeMoreButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -27),
            
            collectionView.topAnchor.constraint(equalTo: bestSeller.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
