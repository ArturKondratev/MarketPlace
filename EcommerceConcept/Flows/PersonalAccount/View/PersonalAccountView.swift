//
//  PersonalAccountView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

class PersonalAccountView: UIView {
    
    // MARK: - Subviews
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .mainBackgroundColor
        tableView.separatorInset.left = 16
        tableView.separatorInset.right = 16
        tableView.register(PersonalAccTableViewCell.self, forCellReuseIdentifier: PersonalAccTableViewCell.identifier)
        tableView.register(PersonalAccountHeaderView.self, forHeaderFooterViewReuseIdentifier: PersonalAccountHeaderView.identifier)
        tableView.register(PersonAccountFooterView.self, forHeaderFooterViewReuseIdentifier: PersonAccountFooterView.identifier)
        return tableView
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
    
    //MARK: - UI
    private func setUI() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
