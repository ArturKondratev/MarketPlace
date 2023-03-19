//
//  PersonAccountFooterView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

class PersonAccountFooterView: UITableViewHeaderFooterView {
    
    static let identifier = "PersonAccountFooterView"
    
    // MARK: - Subviews
    let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign out", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .brandOrange
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.brandDarkBlue.cgColor
        button.addTarget(self, action: #selector(exitButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func exitButtonAction() {
        print("exit")
    }
    
    // MARK: - UI
    func setConstraints() {
        contentView.addSubview(exitButton)
        NSLayoutConstraint.activate([
            exitButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 80),
            exitButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -80),
            exitButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
