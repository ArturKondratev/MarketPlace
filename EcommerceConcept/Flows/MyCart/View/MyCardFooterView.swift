//
//  MyCardFooterView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 19.01.2023.
//

import UIKit

class MyCardFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    static let identifier = "MyCardFooterView"
    
    // MARK: - Subviews
    private lazy var totalLabel = makeLabel(text: "Total",
                                            color: .mainBackgroundColor,
                                            font: .systemFont(ofSize: 18))
    
    private lazy var deliveryLabel = makeLabel(text: "Delivery",
                                               color: .mainBackgroundColor,
                                               font: .systemFont(ofSize: 18))
    
    lazy var costLabe = makeLabel(text: "$2,500 us",
                                  color: .white,
                                  font: .boldSystemFont(ofSize: 24))
    
    lazy var deliveryCostLabel = makeLabel(text: "Free",
                                           color: .white,
                                           font: .boldSystemFont(ofSize: 24))
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    func setConstraints() {
        addSubview(totalLabel)
        addSubview(deliveryLabel)
        addSubview(costLabe)
        addSubview(deliveryCostLabel)
        
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            totalLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            deliveryLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 16),
            deliveryLabel.leftAnchor.constraint(equalTo: totalLabel.leftAnchor),
            
            costLabe.centerYAnchor.constraint(equalTo: totalLabel.centerYAnchor),
            costLabe.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            deliveryCostLabel.centerYAnchor.constraint(equalTo: deliveryLabel.centerYAnchor),
            deliveryCostLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
}

extension MyCardFooterView {
    func makeLabel(text: String, color: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = color
        label.font = font
        return label
    }
}
