//
//  MenuTableCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 14.01.2023.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    static let reuseId = "MenuTableCell"
    
    //MARK: - SubViews
    lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = .mainBackgroundColor
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .mainBackgroundColor
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    func setUI() {
        addSubview(iconImageView)
        addSubview(myLabel)
        backgroundColor = .brandDarkBlue
        
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        myLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12).isActive = true
    }
}
