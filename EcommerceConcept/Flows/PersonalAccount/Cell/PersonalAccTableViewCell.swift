//
//  PersonalAccTableViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

class PersonalAccTableViewCell: UITableViewCell {

    static let identifier = "PersonalAccTableViewCell"
    
    // MARK: - Subviews
    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .brandDarkBlue
        return image
    }()
    
    lazy var setLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .brandDarkBlue
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func configure(icon: String, name: String) {
        self.icon.image = UIImage(systemName: icon) ?? UIImage()
        self.setLable.text = name
    }
    
    // MARK: - UI
    private func setUI() {
        contentView.addSubview(icon)
        contentView.addSubview(setLable)
        self.backgroundColor = .mainBackgroundColor
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalToConstant: 20),
            
            setLable.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            setLable.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 16)
        ])
    }
}
