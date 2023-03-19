//
//  MyCartViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 18.01.2023.
//

import UIKit

protocol MyCartViewDeleget: AnyObject {
    func deleteProduct(from cell: UITableViewCell)
    func minusProduct(from cell: UITableViewCell)
    func plusProduct(from cell: UITableViewCell)
}

class MyCartViewCell: UITableViewCell {

    static let identifier = "MyCartViewCell"
    weak var delegete: MyCartViewDeleget?
    
    //MARK: - SubViews
    lazy var deviceImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
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
        label.textColor = .brandOrange
        label.font = UIFont.boldSystemFont(ofSize: 18)
        //label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var grayBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayButtomColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .mainBackgroundColor
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusProduct), for: .touchUpInside)
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .mainBackgroundColor
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.addTarget(self, action: #selector(minusProduct), for: .touchUpInside)
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(deleteProduct), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .mainBackgroundColor
        button.setImage(UIImage(systemName: "cart.badge.minus"), for: .normal)
        return button
    }()
    
    lazy var deviceCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mainBackgroundColor
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        deviceImage.image = nil
        deviceName.text = nil
        deviceCost.text = nil
        deviceCount.text = nil
    }
    
    //MARK: - Actions
    @objc func deleteProduct() {
        delegete?.deleteProduct(from: self)
    }
    
    @objc func minusProduct() {
        delegete?.minusProduct(from: self)
    }
    
    @objc func plusProduct() {
        delegete?.plusProduct(from: self)
    }
    
    //MARK: - Configure
    func configure(icon: String, name: String, cost: Int, count: Int) {
        deviceImage.image = UIImage(named: icon)
        deviceName.text = name
        deviceCost.text = "$"+cost.description
        deviceCount.text = count.description
    }
    
    //MARK: - UI
    func setupViews() {
        contentView.backgroundColor = .brandDarkBlue
        contentView.addSubview(deviceImage)
        contentView.addSubview(deviceName)
        contentView.addSubview(deviceCost)
        contentView.addSubview(deleteButton)
        contentView.addSubview(grayBottomView)
        contentView.addSubview(plusButton)
        contentView.addSubview(minusButton)
        contentView.addSubview(deviceCount)

        NSLayoutConstraint.activate([
            deviceImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            deviceImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            deviceImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            deviceImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 14),
            deviceImage.heightAnchor.constraint(equalToConstant: 90),
            deviceImage.widthAnchor.constraint(equalToConstant: 110),
            
            deviceName.topAnchor.constraint(equalTo: deviceImage.topAnchor),
            deviceName.leftAnchor.constraint(equalTo: deviceImage.rightAnchor, constant: 8),
            deviceName.rightAnchor.constraint(equalTo: grayBottomView.leftAnchor, constant: -8),

            deviceCost.topAnchor.constraint(equalTo: deviceName.bottomAnchor, constant: 8),
            deviceCost.leftAnchor.constraint(equalTo: deviceName.leftAnchor),

            deleteButton.centerYAnchor.constraint(equalTo: deviceImage.centerYAnchor),
            deleteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.widthAnchor.constraint(equalToConstant: 30),

            grayBottomView.centerYAnchor.constraint(equalTo: deviceImage.centerYAnchor),
            grayBottomView.rightAnchor.constraint(equalTo: deleteButton.leftAnchor, constant: -8),
            grayBottomView.heightAnchor.constraint(equalToConstant: 80),
            grayBottomView.widthAnchor.constraint(equalToConstant: 30),
            
            deviceCount.centerYAnchor.constraint(equalTo: grayBottomView.centerYAnchor),
            deviceCount.centerXAnchor.constraint(equalTo: grayBottomView.centerXAnchor),

            minusButton.centerXAnchor.constraint(equalTo: grayBottomView.centerXAnchor),
            minusButton.topAnchor.constraint(equalTo: grayBottomView.topAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),

            plusButton.centerXAnchor.constraint(equalTo: grayBottomView.centerXAnchor),
            plusButton.bottomAnchor.constraint(equalTo: grayBottomView.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
