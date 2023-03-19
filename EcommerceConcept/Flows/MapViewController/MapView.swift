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
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.subtitleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .white
        button.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .brandDarkBlue
        config.title = "Save address"
        config.subtitle = "your address"
        config.titleAlignment = .center
        button.configuration = config
        return button
    }()
    
    lazy var locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "location.north.line.fill"), for: .normal)
        button.configuration = .plain()
        button.tintColor = .brandOrange
        return button
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
    
    // MARK: - UI
    func addViews() {
        backgroundColor = .mainBackgroundColor
        addSubview(map)
        addSubview(locationButton)
        addSubview(saveButton)

        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: topAnchor),
            map.leftAnchor.constraint(equalTo: leftAnchor),
            map.rightAnchor.constraint(equalTo: rightAnchor),
            map.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            locationButton.centerXAnchor.constraint(equalTo: map.centerXAnchor),
            locationButton.centerYAnchor.constraint(equalTo: map.centerYAnchor, constant: 30),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            saveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
