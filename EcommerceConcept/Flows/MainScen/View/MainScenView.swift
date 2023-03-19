//
//  MainScenView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 10.01.2023.
//

import UIKit

final class MainScenView: UIView {
    
    // MARK: - Subviews
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var arrowUppButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "control"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray3
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.isHidden = true
        button.alpha = 0.5
        return button
    }()
    
    //MARK: - TabBarSubViews
    lazy var tabBarView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .brandDarkBlue
        contentView.layer.cornerRadius = 30
        contentView.clipsToBounds = true
        return contentView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .brandDarkBlue
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var explorerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "• Explorer"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var bagButton: BadgeButton = {
        let button = BadgeButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bag"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var heartButton: BadgeButton = {
        let button = BadgeButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var personButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUI()
    }
    
    // MARK: - UI
    private func setUI() {
        self.backgroundColor = .mainBackgroundColor
        addTabBar()
        addScroleView()
        addScrollToUpButton()
    }
    
    func addScroleView() {
        self.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: tabBarView.topAnchor, constant: -16),
            self.scrollView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    func addScrollToUpButton() {
        self.addSubview(self.arrowUppButton)
        
        NSLayoutConstraint.activate([
            arrowUppButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            arrowUppButton.bottomAnchor.constraint(equalTo: tabBarView.topAnchor, constant: -16),
            arrowUppButton.heightAnchor.constraint(equalToConstant: 50),
            arrowUppButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addTabBar() {
        self.addSubview(self.tabBarView)
        self.tabBarView.addSubview(self.stackView)
        
        stackView.addArrangedSubview(explorerLabel)
        stackView.addArrangedSubview(bagButton)
        stackView.addArrangedSubview(heartButton)
        stackView.addArrangedSubview(personButton)
        
        NSLayoutConstraint.activate([
            self.tabBarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            self.tabBarView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            self.tabBarView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.tabBarView.heightAnchor.constraint(equalToConstant: 72),
            
            self.stackView.centerXAnchor.constraint(equalTo: tabBarView.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: tabBarView.centerYAnchor),
            self.stackView.rightAnchor.constraint(equalTo: tabBarView.rightAnchor, constant: -30),
            self.stackView.leftAnchor.constraint(equalTo: tabBarView.leftAnchor, constant: 30),
            self.stackView.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor),
            self.stackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
