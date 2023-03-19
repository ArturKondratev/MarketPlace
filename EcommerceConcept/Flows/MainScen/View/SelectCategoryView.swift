//
//  SelectCategoryView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 08.01.2023.
//

import UIKit

class SelectCategoryView: UIView {

    // MARK: - Subviews
    lazy var selectCategoryLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "Select Category"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("see more", for: .normal)
        button.tintColor = .brandOrange
        return button
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 23
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .mainBackgroundColor
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
        collectionView.register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: SelectCategoryCollectionViewCell.identifier)
        return collectionView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainBackgroundColor
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    // MARK: - UI
    private func setUI() {
        self.addSubview(selectCategoryLable)
        self.addSubview(buyButton)
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            selectCategoryLable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            selectCategoryLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
        
            buyButton.centerYAnchor.constraint(equalTo: selectCategoryLable.centerYAnchor),
            buyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -26),
            
            collectionView.topAnchor.constraint(equalTo: selectCategoryLable.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
