//
//  FavoriteViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

protocol FavoriteViewCellProtocol: AnyObject {
    func tabLikeButton(from cell: UITableViewCell)
}

class FavoriteViewCell: UITableViewCell {

    static let identifier = "FavoriteViewCell"
    weak var delegate: FavoriteViewCellProtocol?
    
    //MARK: - SubViews
    lazy var deviceImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
      //  image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var deviceName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mainBackgroundColor
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var deviceCost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mainBackgroundColor
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
        
    lazy var deleteFavoriteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(deleteProduct), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        deviceImage.image = nil
        deviceName.text = nil
        deviceCost.text = nil
    }
    
    @objc func deleteProduct() {
        delegate?.tabLikeButton(from: self)
    }
    
    //MARK: - UiConfigure
    func configure(model: ProductModel) {
        deviceImage.image = UIImage(named: model.picture.first ?? "star")
        deviceName.text = model.title
        deviceCost.text = "$" + model.discounPrice.description
    }
    
    func setupViews() {
        contentView.backgroundColor = .brandDarkBlue
        contentView.addSubview(deviceImage)
        contentView.addSubview(deviceName)
        contentView.addSubview(deviceCost)
        contentView.addSubview(deleteFavoriteButton)

        NSLayoutConstraint.activate([
            deviceImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            deviceImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            deviceImage.heightAnchor.constraint(equalToConstant: 80),
            deviceImage.widthAnchor.constraint(equalToConstant: 80),
            
            deleteFavoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            deleteFavoriteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            deleteFavoriteButton.heightAnchor.constraint(equalToConstant: 40),
            deleteFavoriteButton.widthAnchor.constraint(equalToConstant: 40),

            deviceName.topAnchor.constraint(equalTo: deviceImage.topAnchor),
            deviceName.leftAnchor.constraint(equalTo: deviceImage.rightAnchor, constant: 8),
            deviceName.rightAnchor.constraint(equalTo: deleteFavoriteButton.leftAnchor, constant: -8),

            deviceCost.topAnchor.constraint(equalTo: deviceName.bottomAnchor, constant: 8),
            deviceCost.leftAnchor.constraint(equalTo: deviceName.leftAnchor),
            deviceCost.rightAnchor.constraint(equalTo: deviceName.rightAnchor),
        ])
    }
}
