//
//  ScreenShotsView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class ScreenShotsView: UIView {
    
    // MARK: - Subviews
    private(set) var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .mainBackgroundColor
        collectionView.isPagingEnabled = true
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: ScreenshotsCell.reuseId)
        return collectionView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addCollectionView()
    }
    
    // MARK: - UI
    func addCollectionView() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
