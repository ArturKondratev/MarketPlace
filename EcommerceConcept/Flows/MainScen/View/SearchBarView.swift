//
//  SearchBarView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 08.01.2023.
//

import UIKit

protocol SearchBarViewDelegete: AnyObject {
    func serchBattonAction(text: String)
}

class SearchBarView: UIView {
    
    //MARK: - Propertis
    var delegete: SearchBarViewDelegete?
    
    // MARK: - Subviews
    lazy var whiteBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 17
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .brandOrange
        return image
    }()
    
    lazy var textField: UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.backgroundColor = .white
        textF.tintColor = .brandDarkBlue
        textF.placeholder = "Search"
        textF.addTarget(self, action: #selector(seatchButtonPressed), for: .touchUpInside)
        textF.clearButtonMode = .whileEditing
        return textF
    }()

    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.backgroundColor = .brandOrange
        button.tintColor = .white
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(seatchButtonPressed), for: .touchUpInside)
        return button
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
    
    // MARK: - Functions
    @objc func seatchButtonPressed() {
        delegete?.serchBattonAction(text: textField.text ?? "")
    }
    
    // MARK: - UI
    private func setUI() {
        self.addSubview(searchButton)
        self.addSubview(whiteBottomView)
        self.addSubview(iconView)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            self.searchButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.searchButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            self.searchButton.heightAnchor.constraint(equalToConstant: 34),
            self.searchButton.widthAnchor.constraint(equalToConstant: 34),
            
            self.whiteBottomView.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.whiteBottomView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            self.whiteBottomView.rightAnchor.constraint(equalTo: searchButton.leftAnchor, constant: -16),
            self.whiteBottomView.heightAnchor.constraint(equalToConstant: 34),
            
            self.iconView.centerYAnchor.constraint(equalTo: whiteBottomView.centerYAnchor),
            self.iconView.leftAnchor.constraint(equalTo: whiteBottomView.leftAnchor, constant: 8),
            self.iconView.heightAnchor.constraint(equalToConstant: 28),
            self.iconView.widthAnchor.constraint(equalToConstant: 28),
            
            self.textField.centerYAnchor.constraint(equalTo: whiteBottomView.centerYAnchor),
            self.textField.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8),
            self.textField.rightAnchor.constraint(equalTo: whiteBottomView.rightAnchor, constant: -8),
            self.textField.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
}
