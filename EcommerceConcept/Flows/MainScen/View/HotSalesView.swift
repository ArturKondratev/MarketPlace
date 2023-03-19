//
//  HotSalesView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 11.01.2023.
//

import UIKit

class HotSalesView: UIView {

    // MARK: - Subviews
    private(set) var hotSalesLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "Hot sales"
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
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
     //   collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .mainBackgroundColor
        collectionView.register(HotSalesViewCell.self, forCellWithReuseIdentifier: HotSalesViewCell.identifier)
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
        self.addSubview(hotSalesLable)
        self.addSubview(seeMoreButton)
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            hotSalesLable.topAnchor.constraint(equalTo: topAnchor),
            hotSalesLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
        
            seeMoreButton.centerYAnchor.constraint(equalTo: hotSalesLable.centerYAnchor),
            seeMoreButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -27),
            
            collectionView.topAnchor.constraint(equalTo: hotSalesLable.bottomAnchor, constant: 8),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 198) //198
        ])
    }
}
