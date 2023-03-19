//
//  CustomSearchBar.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 07.03.2023.
//

import UIKit

class CustomSearchBar: UITextField {
    
    //MARK: - Private Property
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    //MARK: - Initializers
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    //MARK: - Private Methods
    private func setupTextField(placeholder: String) {
        textColor = .white
        
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.mainBackgroundColor.cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 15, height: 15)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan])
        font = .boldSystemFont(ofSize: 18)
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
