//
//  MyCartView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 18.01.2023.
//

import UIKit

class MyCartView: UIView {
    
    // MARK: - SubView
    lazy var myCardLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "My Cart"
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
    
    lazy var checkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandOrange
        button.tintColor = .white
        button.layer.cornerRadius = 14
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .brandDarkBlue
        tableView.register(MyCartViewCell.self, forCellReuseIdentifier: MyCartViewCell.identifier)
        tableView.register(MyCardFooterView.self, forHeaderFooterViewReuseIdentifier: MyCardFooterView.identifier)
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
        addSubview(myCardLable)
        addSubview(blueBottomView)
        addSubview(checkoutButton)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            myCardLable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            myCardLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            blueBottomView.topAnchor.constraint(equalTo: myCardLable.bottomAnchor, constant: 20),
            blueBottomView.leftAnchor.constraint(equalTo: leftAnchor),
            blueBottomView.rightAnchor.constraint(equalTo: rightAnchor),
            blueBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            checkoutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            checkoutButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            checkoutButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            checkoutButton.heightAnchor.constraint(equalToConstant: 54),
            
            tableView.topAnchor.constraint(equalTo: blueBottomView.topAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: blueBottomView.leftAnchor, constant: 8),
            tableView.rightAnchor.constraint(equalTo: blueBottomView.rightAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -20)
        ])
    }
}
