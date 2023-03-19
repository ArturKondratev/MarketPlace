//
//  TabBarView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class TabBarView: UIView {
    
    //MARK: - Constraints
    var sliderCenterButton1 = NSLayoutConstraint()
    var sliderCenterButton2 = NSLayoutConstraint()
    var sliderCenterButton3 = NSLayoutConstraint()
    
    // MARK: - SabViews
    lazy var sliderVew: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brandOrange
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    lazy var shopButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Shop", for: .normal)
        button.tintColor = .brandDarkBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var detailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        button.tintColor = .brandDarkBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var featuresButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Features", for: .normal)
        button.tintColor = .brandDarkBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var cpuIcon = makeImage(imageName: "cpu")
    lazy var cameraIcon = makeImage(imageName: "camera")
    lazy var memoryIcon = makeImage(imageName: "memorychip")
    lazy var sdCardIcon = makeImage(imageName: "sdcard")
    
    lazy var cpuText = makeLable(text: "M1")
    lazy var cameraText = makeLable(text: "HD 720p")
    lazy var memoryText = makeLable(text: "8 GB")
    lazy var sdCardtext = makeLable(text: "256 GB")
    
    private let stackViewForIcons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    private let stackViewForButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTabBarView()
        addDescriptionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTabBarView()
        addDescriptionView()
    }
    
    func addTabBarView() {
        backgroundColor = .mainBackgroundColor
        self.addSubview(stackViewForButtons)
        stackViewForButtons.addArrangedSubview(shopButton)
        stackViewForButtons.addArrangedSubview(detailsButton)
        stackViewForButtons.addArrangedSubview(featuresButton)
        
        NSLayoutConstraint.activate([
            stackViewForButtons.topAnchor.constraint(equalTo: topAnchor),
            stackViewForButtons.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            stackViewForButtons.rightAnchor.constraint(equalTo: rightAnchor, constant: -30)
        ])

        self.addSubview(sliderVew)
        sliderVew.heightAnchor.constraint(equalToConstant: 8).isActive = true
        sliderVew.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sliderVew.topAnchor.constraint(equalTo: shopButton.bottomAnchor).isActive = true
        
        sliderCenterButton1 = sliderVew.centerXAnchor.constraint(equalTo: shopButton.centerXAnchor)
        sliderCenterButton2 = sliderVew.centerXAnchor.constraint(equalTo: detailsButton.centerXAnchor)
        sliderCenterButton3 = sliderVew.centerXAnchor.constraint(equalTo: featuresButton.centerXAnchor)
        sliderCenterButton1.isActive = true
    }
    
    func addDescriptionView() {
        self.addSubview(stackViewForIcons)
        stackViewForIcons.addArrangedSubview(cpuIcon)
        stackViewForIcons.addArrangedSubview(cameraIcon)
        stackViewForIcons.addArrangedSubview(memoryIcon)
        stackViewForIcons.addArrangedSubview(sdCardIcon)
        
        self.addSubview(cpuText)
        self.addSubview(cameraText)
        self.addSubview(memoryText)
        self.addSubview(sdCardtext)
        
        NSLayoutConstraint.activate([
            stackViewForIcons.topAnchor.constraint(equalTo: sliderVew.bottomAnchor, constant: 10),
            stackViewForIcons.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            stackViewForIcons.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            cpuText.centerXAnchor.constraint(equalTo: cpuIcon.centerXAnchor),
            cpuText.topAnchor.constraint(equalTo: cpuIcon.bottomAnchor, constant: 8),
            cameraText.centerXAnchor.constraint(equalTo: cameraIcon.centerXAnchor),
            cameraText.topAnchor.constraint(equalTo: cameraIcon.bottomAnchor, constant: 8),
            memoryText.centerXAnchor.constraint(equalTo: memoryIcon.centerXAnchor),
            memoryText.topAnchor.constraint(equalTo: memoryIcon.bottomAnchor, constant: 8),
            sdCardtext.centerXAnchor.constraint(equalTo: sdCardIcon.centerXAnchor),
            sdCardtext.topAnchor.constraint(equalTo: sdCardIcon.bottomAnchor, constant: 8)
        ])
        
        for view in stackViewForIcons.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 40),
                view.heightAnchor.constraint(equalToConstant: 40),
            ])
        }
    }
}

extension TabBarView {
    func makeImage(imageName: String) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: imageName)
        image.tintColor = .systemGray
        return image
    }
    
    func makeLable(text: String) -> UILabel {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = text
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        lable.textColor = .systemGray
        return lable
    }
}
