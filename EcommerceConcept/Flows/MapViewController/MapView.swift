//
//  MapView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 03.03.2023.
//

import UIKit
import MapKit

protocol MapViewProtocol: AnyObject {
    func didTabSaveButton()
    func didTabNavigationButton()
}

class MapView: UIView {
    
    weak var delegate: MapViewProtocol?
    
    // MARK: - SabViews
    lazy var map: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.setTitle("Save address", for: .normal)
        button.backgroundColor = .brandDarkBlue
        button.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "naigation"), for: .normal)
        button.addTarget(self, action: #selector(navigationButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var addressLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var pinImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "pin")
        return image
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
    
    //MARK: - Actions
    @objc func saveButtonAction() {
        delegate?.didTabSaveButton()
    }
    
    @objc func navigationButtonAction() {
        delegate?.didTabNavigationButton()
    }
    
    // MARK: - UI
    func addViews() {
        backgroundColor = .mainBackgroundColor
        addSubview(map)
        addSubview(locationButton)
        addSubview(saveButton)
        addSubview(addressLable)
        addSubview(pinImage)

        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: topAnchor),
            map.leftAnchor.constraint(equalTo: leftAnchor),
            map.rightAnchor.constraint(equalTo: rightAnchor),
            map.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            saveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
                    
            locationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            locationButton.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -100),
            locationButton.widthAnchor.constraint(equalToConstant: 48),
            locationButton.heightAnchor.constraint(equalToConstant: 48),
            
            addressLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            addressLable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            addressLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            addressLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            pinImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pinImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            pinImage.widthAnchor.constraint(equalToConstant: 48),
            pinImage.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
