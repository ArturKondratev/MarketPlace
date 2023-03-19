//
//  ScreenshotsCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 16.01.2023.
//

import UIKit

class ScreenshotsCell: UICollectionViewCell {
    
    static let reuseId = "ScreenshotsCell"
    
    //MARK: - SubViews
    lazy var screenshot: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.screenshot.image = nil
    }
    
    //MARK: - Configure
    func configure(image: UIImage) {
        self.screenshot.image = image
    }
    
    //MARK: - UI
    func setUI() {
        backgroundColor = .white
        contentView.addSubview(screenshot)
        NSLayoutConstraint.activate([
            screenshot.topAnchor.constraint(equalTo: contentView.topAnchor),
            screenshot.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            screenshot.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            screenshot.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
