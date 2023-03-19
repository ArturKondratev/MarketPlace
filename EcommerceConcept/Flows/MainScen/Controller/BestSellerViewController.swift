//
//  BestSellerViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 10.01.2023.
//

import UIKit

class BestSellerViewController: UIViewController {
    
    //MARK: - Properties
    private let viewModel: MainScenViewModel
    var bestSelerProducts = [ProductModel](){
        didSet{
            bestSellerView.collectionView.reloadData()
        }
    }
     var bestSellerView: BestSellerView {
        return self.view as! BestSellerView
    }
    
    //MARK: - LifeCycle
    init(viewModel: MainScenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = BestSellerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bestSellerView.collectionView.delegate = self
        bestSellerView.collectionView.dataSource = self
        bindViewModel()
    }
    
    // MARK: - Private methods
    private func bindViewModel() {
        self.viewModel.bestSeller .addObserver(self) { [weak self] (bestSeller, _) in
            self?.bestSelerProducts = bestSeller
        }
    }
}

extension BestSellerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return bestSelerProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCollectionViewCell.identifier, for: indexPath) as? BestSellerCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(device: bestSelerProducts[indexPath.row])
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(product: bestSelerProducts[indexPath.row])
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    //    return CGSize(width: Constants.galleryBestSellerWidth , height: 227)
        return CGSize(width: (bestSellerView.collectionView.frame.width - 32.0) / 2 , height: 227)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
