//
//  PersonalAccountHeaderView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

protocol PersonalAccountHeaderViewProtocol: AnyObject {
    func didTabAvatar(sender: UITapGestureRecognizer)
}

class PersonalAccountHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "PersonalAccountHeaderView"
    weak var delegate: PersonalAccountHeaderViewProtocol?
    
    // MARK: - Subviews
    lazy var personIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "person")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 75
        image.layer.shadowOpacity = 0.5
        image.layer.shadowColor = UIColor.red.cgColor
        image.layer.shadowRadius = 5
        image.layer.shadowOffset = CGSize(width: 10, height: 5)
        image.layer.masksToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar(sender:)))
        image.addGestureRecognizer(tapGesture)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy var personMail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .systemGray
        label.text = "DwayneJohnson@gmail.com"
        return label
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    //MARK: - Actions
    @objc func tapOnAvatar(sender: UITapGestureRecognizer) {
        delegate?.didTabAvatar(sender: sender)
    }
    
    // MARK: - UI
    private func setUI() {
        self.addSubview(personIcon)
        self.addSubview(personMail)
        
        NSLayoutConstraint.activate([
            personIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            personIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            personIcon.widthAnchor.constraint(equalToConstant: 150),
            personIcon.heightAnchor.constraint(equalToConstant: 150),
            
            personMail.topAnchor.constraint(equalTo: personIcon.bottomAnchor, constant: 8),
            personMail.centerXAnchor.constraint(equalTo: personIcon.centerXAnchor)
        ])
    }
}

