//
//  BestSellerCollectionViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 08.01.2023.
//

import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BestSellerCollectionViewCell"
    
    // MARK: - Subviews
    lazy var whiteButtomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var likeWiteButtomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 25/2
        view.layer.shadowColor   = UIColor.lightGray.cgColor
        view.layer.shadowOffset  = CGSize(width: 0.0, height: 3.0)
        view.layer.shadowRadius  = 6
        view.layer.shadowOpacity = 0.5
        view.clipsToBounds       = true
        view.layer.masksToBounds = false
        return view
    }()
    
    lazy var likeButon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.tintColor = .brandOrange
        image.image = UIImage(systemName: "heart")
        return image
    }()
        
    lazy var discountPriceLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "$70"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var priceLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "$100"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var deviceNameLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "$70"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
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
        discountPriceLable.text = nil
        priceLable.text = nil
        deviceNameLable.text = nil
    }
    
    // MARK: - Functions
    func configure(device: ProductModel) {
        mainImage.image = UIImage(named: device.picture.first ?? "iphone")
        deviceNameLable.text = device.title
        discountPriceLable.text = "$" + device.discounPrice.description
        
        priceLable.attributedText = NSAttributedString(
            string: "$" + device.priceWithoutPrice.description,
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        
        if device.isFavorites {
            likeButon.image = UIImage(systemName: "suit.heart.fill")
        }
    }
    
    // MARK: - UI
    private func setUI() {
        self.addSubview(whiteButtomView)
        self.addSubview(mainImage)
        self.addSubview(likeWiteButtomView)
        self.addSubview(likeButon)
        self.addSubview(discountPriceLable)
        self.addSubview(priceLable)
        self.addSubview(deviceNameLable)

        NSLayoutConstraint.activate([
            whiteButtomView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            whiteButtomView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor),
            whiteButtomView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor),
            whiteButtomView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            mainImage.topAnchor.constraint(equalTo: whiteButtomView.topAnchor, constant: 5),
            mainImage.leftAnchor.constraint(equalTo: whiteButtomView.leftAnchor),
            mainImage.rightAnchor.constraint(equalTo: whiteButtomView.rightAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 168),

            likeWiteButtomView.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 6),
            likeWiteButtomView.rightAnchor.constraint(equalTo: mainImage.rightAnchor, constant: -15),
            likeWiteButtomView.widthAnchor.constraint(equalToConstant: 25),
            likeWiteButtomView.heightAnchor.constraint(equalToConstant: 25),
            
            likeButon.centerXAnchor.constraint(equalTo: likeWiteButtomView.centerXAnchor),
            likeButon.centerYAnchor.constraint(equalTo: likeWiteButtomView.centerYAnchor),
            likeButon.widthAnchor.constraint(equalToConstant: 15),
            likeButon.heightAnchor.constraint(equalToConstant: 15),
            
            discountPriceLable.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 2),
            discountPriceLable.leftAnchor.constraint(equalTo: mainImage.leftAnchor, constant: 20),
            
            priceLable.bottomAnchor.constraint(equalTo: discountPriceLable.bottomAnchor),
            priceLable.leftAnchor.constraint(equalTo: discountPriceLable.rightAnchor, constant: 8),
            
            deviceNameLable.topAnchor.constraint(equalTo: priceLable.bottomAnchor, constant: 8),
            deviceNameLable.leftAnchor.constraint(equalTo: mainImage.leftAnchor, constant: 20)
        ])
    }
}
