//
//  AddressTableViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 26.03.2023.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    static let identifier = "AddressTableViewCell"
    
    //MARK: - SubViews
    lazy var selectedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var addressText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mainBackgroundColor
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    //MARK: Configure
    func configure(model: AddressModel) {
        addressText.text = "\(model.index) , \(model.city) , \(model.street) , \(model.hous)/\(model.apartmentNumber)"
        if model.isSelected {
            selectedButton.setImage(UIImage(named: "selected"), for: .normal)
        } else {
            selectedButton.setImage(UIImage(named: "deselect"), for: .normal)
        }
    }
    
    //MARK: - SetUI
    func setUI() {
        contentView.backgroundColor = .brandDarkBlue
        contentView.addSubview(selectedButton)
        contentView.addSubview(addressText)
        
        NSLayoutConstraint.activate([
            selectedButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectedButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            selectedButton.widthAnchor.constraint(equalToConstant: 30),
            selectedButton.heightAnchor.constraint(equalToConstant: 30),
            
            addressText.centerYAnchor.constraint(equalTo: selectedButton.centerYAnchor),
            addressText.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            addressText.leftAnchor.constraint(equalTo: selectedButton.rightAnchor, constant: 8),
            addressText.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            addressText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

