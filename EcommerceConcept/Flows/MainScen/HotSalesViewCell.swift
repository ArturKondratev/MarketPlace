//
//  HotSalesViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 08.01.2023.
//

import UIKit

class HotSalesViewCell: UICollectionViewCell {
    
    static let identifier = "HotSalesViewCell"
    
    // MARK: - Subviews
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var orangeRoundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brandOrange
        view.clipsToBounds = true
        view.layer.cornerRadius = 28 / 2
        return view
    }()
    
    lazy var newLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var deviceModelLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Iphone 12"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    lazy var deviceDescriptionLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Iphone 12"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    lazy var buyButtonAction: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy now!", for: .normal)
        button.tintColor = .brandDarkBlue
        button.backgroundColor = .white
        button.layer.cornerRadius = 23 / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImage.image = nil
        deviceModelLable.text = nil
        deviceDescriptionLable.text = nil
    }
    
    // MARK: - Functions
    func configure(model: ProductModel) {
        mainImage.image = UIImage(named: model.picture.first!)
        deviceModelLable.text = model.title
        deviceDescriptionLable.text = model.subtitle
        
        if !(model.isNew ) {
            orangeRoundView.isHidden = true
            newLable.isHidden = true
        }
    }
    
    @objc func buyButtonPressed() {
        print("CLICK BITTON")
    }
    
    // MARK: - UI
    private func setUI() {
        self.addSubview(mainImage)
        self.addSubview(orangeRoundView)
        self.addSubview(newLable)
        self.addSubview(deviceModelLable)
        self.addSubview(deviceDescriptionLable)
        self.addSubview(buyButtonAction)
        
        NSLayoutConstraint.activate([
            self.mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.mainImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            self.mainImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            self.mainImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            self.orangeRoundView.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            self.orangeRoundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            self.orangeRoundView.widthAnchor.constraint(equalToConstant: 28),
            self.orangeRoundView.heightAnchor.constraint(equalToConstant: 28),
            
            self.newLable.centerXAnchor.constraint(equalTo: orangeRoundView.centerXAnchor),
            self.newLable.centerYAnchor.constraint(equalTo: orangeRoundView.centerYAnchor),
            
            self.deviceModelLable.topAnchor.constraint(equalTo: orangeRoundView.bottomAnchor, constant: 18),
            self.deviceModelLable.leftAnchor.constraint(equalTo: orangeRoundView.leftAnchor),
            
            self.deviceDescriptionLable.topAnchor.constraint(equalTo: deviceModelLable.bottomAnchor, constant: 5),
            self.deviceDescriptionLable.leftAnchor.constraint(equalTo: deviceModelLable.leftAnchor),
            
            self.buyButtonAction.topAnchor.constraint(equalTo: deviceDescriptionLable.bottomAnchor, constant: 26),
            self.buyButtonAction.leftAnchor.constraint(equalTo: deviceDescriptionLable.leftAnchor),
            self.buyButtonAction.widthAnchor.constraint(equalTo: mainImage.widthAnchor, multiplier: 0.3),
            self.buyButtonAction.heightAnchor.constraint(equalToConstant: 23)
        ])
    }
}
