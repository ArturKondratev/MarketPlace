//
//  FavoriteView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

class FavoriteView: UIView {
    
    // MARK: - SubView
    lazy var favoriteLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "Favorite"
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
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .brandDarkBlue
        tableView.register(FavoriteViewCell.self, forCellReuseIdentifier: FavoriteViewCell.identifier)
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
        self.addSubview(favoriteLable)
        self.addSubview(blueBottomView)
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            favoriteLable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            favoriteLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            blueBottomView.topAnchor.constraint(equalTo: favoriteLable.bottomAnchor, constant: 20),
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
