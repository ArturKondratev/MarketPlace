//
//  ScreenShotsViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class ScreenShotsViewController: UIViewController {
    
    // MARK: - Private Properties
    private var screenShots = [String](){
        didSet {
            self.screenShotsView.collectionView.reloadData()
        }
    }
    
    private let viewModel: ProductDetailViewModel
    
    private var screenShotsView: ScreenShotsView {
        return self.view as! ScreenShotsView
    }
    
    // MARK: - Init
    init(product: ProductModel, viewModel: ProductDetailViewModel) {
        self.screenShots = product.picture
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = ScreenShotsView()
        view.backgroundColor = .mainBackgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenShotsView.collectionView.dataSource = self
        screenShotsView.collectionView.delegate = self
    }
}

extension ScreenShotsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenShots.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotsCell.reuseId, for: indexPath) as? ScreenshotsCell else { return UICollectionViewCell() }
        cell.configure(image: UIImage(named: screenShots[indexPath.row]) ?? UIImage())
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        viewModel.tabToImage(screenShots: self.screenShots, indexPath: indexPath)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 16, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: -8)
    }
}
