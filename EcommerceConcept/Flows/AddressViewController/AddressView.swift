//
//  AddressView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 26.03.2023.
//

import UIKit

class AddressView: UIView {

    // MARK: - SubView
    lazy var deliveryAddressLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "Delivery address"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 32, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
        
    lazy var blueBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brandDarkBlue
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset.left = 8
        tableView.separatorInset.right = 8
        tableView.separatorColor = .mainBackgroundColor
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .brandDarkBlue
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(AddressTableViewCell.self, forCellReuseIdentifier: AddressTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
    }
    
    // MARK: - UI
    func addViews() {
        backgroundColor = .mainBackgroundColor
        self.addSubview(deliveryAddressLable)
        self.addSubview(blueBottomView)
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            deliveryAddressLable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            deliveryAddressLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            deliveryAddressLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            blueBottomView.topAnchor.constraint(equalTo: deliveryAddressLable.bottomAnchor, constant: 8),
            blueBottomView.leftAnchor.constraint(equalTo: leftAnchor),
            blueBottomView.rightAnchor.constraint(equalTo: rightAnchor),
            blueBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: blueBottomView.topAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: blueBottomView.leftAnchor, constant: 8),
            tableView.rightAnchor.constraint(equalTo: blueBottomView.rightAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: blueBottomView.bottomAnchor, constant: -20)
        ])
    }
}
