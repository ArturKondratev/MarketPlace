//
//  FullScreenViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 05.03.2023.
//

import UIKit

class FullScreenViewCell: UICollectionViewCell {
    
    //MARK: - Propertis
    static let identifier = "FullScreenViewCell"
    
    //MARK: - SubViews
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .black
        return scrollView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.5
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
    
    // MARK: - Configure
    func configure(image: String) {
        self.image.image = UIImage(named: image)
    }
    
    // MARK: - UI
    func setUI() {
        addSubview(scrollView)
        scrollView.addSubview(image)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.rightAnchor.constraint(equalTo: rightAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

//MARK: - UIScrollViewDelegate
extension FullScreenViewCell: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        self.scrollView.zoomScale = 1.0
    }
}
