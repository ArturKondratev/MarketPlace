//
//  FullScreenViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 05.03.2023.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    //MARK: - Propertis
    var images = [String]()
    var indexPath: IndexPath!
    var fullScreenView: FullScreenView {
        self.view as! FullScreenView
    }
    
    // MARK: - LifeCycle
    init(screenShots: [String], indexPath: IndexPath) {
        super.init(nibName: nil, bundle: nil)
        self.images = screenShots
        self.indexPath = indexPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = FullScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
    }
    
    // MARK: - Configure
    func setConfig() {
        fullScreenView.collectionView.delegate = self
        fullScreenView.collectionView.dataSource = self
        view.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .mainBackgroundColor
        
        fullScreenView.collectionView.performBatchUpdates(nil) { (result) in
            self.fullScreenView.collectionView.scrollToItem(at: self.indexPath,
                                                            at: .centeredHorizontally,
                                                            animated: false)
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension FullScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullScreenViewCell.identifier, for: indexPath) as? FullScreenViewCell else {
                return UICollectionViewCell()
            }
        cell.configure(image: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
}
