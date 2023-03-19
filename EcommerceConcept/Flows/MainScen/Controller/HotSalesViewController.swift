//
//  HotSalesViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 11.01.2023.
//

import UIKit

class HotSalesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    var hotProducts = [ProductModel](){
        didSet {
            self.hotSalesView.collectionView.reloadData()
            currentCellIndex = 0
            slideToNext()
        }
    }
    private var timer: Timer?
    private var currentCellIndex = 0
    private let viewModel: MainScenViewModel
    private var hotSalesView: HotSalesView {
        return self.view as! HotSalesView
    }
    
    //MARK: - Init
    init(viewModel: MainScenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = HotSalesView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotSalesView.collectionView.dataSource = self
        hotSalesView.collectionView.delegate = self
        bindViewModel()
        
        self.timer = Timer.scheduledTimer(timeInterval: 3.0,
                                          target: self,
                                          selector: #selector(slideToNext),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    // MARK: - Private methods
    private func bindViewModel() {
        self.viewModel.hotSales.addObserver(self) { [weak self] (hotSales, _) in
            self?.hotProducts = hotSales
        }
    }
    
    @objc private func slideToNext() {
        if hotProducts.count == 0 { return }
        
        if currentCellIndex < hotProducts.count - 1  {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        hotSalesView.collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0),
                                                 at: .centeredHorizontally,
                                                 animated: true)
    }
    
    //MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesViewCell.identifier, for: indexPath) as? HotSalesViewCell else { return UICollectionViewCell() }
        cell.configure(model: hotProducts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(product: hotProducts[indexPath.row])
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 16, height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
    }
}
