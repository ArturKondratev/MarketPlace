//
//  SelectCategoryCollectionView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 30.12.2022.
//

import UIKit

class SelectCategoryController: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var devices = [DeviceTypeModel]() {
        didSet {
            self.collectionViewLayout.collectionView?.reloadData()
        }
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .mainBackgroundColor
        delegate = self
        dataSource = self
        register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: SelectCategoryCollectionViewCell.identifier)
        translatesAutoresizingMaskIntoConstraints = false
        //  layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        layout.minimumLineSpacing = 23
        
        contentInset = UIEdgeInsets(top: 0,
                                    left: Constants.leftDistanceToView,
                                    bottom: 0,
                                    right: Constants.rightDistanceToView)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        self.selectItem(at: IndexPath(index: 0), animated: true, scrollPosition: .left)
        self.devices = getMocDevice()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SelectCategoryCollectionViewCell.identifier, for: indexPath) as! SelectCategoryCollectionViewCell
        cell.configure(model: devices[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth,
                      height: frame.height * 0.8)
        
        //        return CGSize(width: 70,
        //                      height: 70)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCollectionViewCell
        cell?.selectCell(state: true)
        selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCollectionViewCell
        cell?.selectCell(state: false)
    }
    
    func set(devices: [DeviceTypeModel]) {
        self.devices = devices
        DispatchQueue.main.async {
            self.collectionViewLayout.collectionView?.reloadData()
        }
    }
    
    private func getMocDevice() -> [DeviceTypeModel] {
        return [
            DeviceTypeModel(name: "Phones", icon: "iphone"),
            DeviceTypeModel(name: "Computer", icon: "desktopcomputer"),
            DeviceTypeModel(name: "Health", icon: "bolt.heart"),
            DeviceTypeModel(name: "Books", icon: "books.vertical"),
            DeviceTypeModel(name: "WWW", icon: "gamecontroller"),
            DeviceTypeModel(name: "SSS", icon: "dpad"),
        ]
    }
}
