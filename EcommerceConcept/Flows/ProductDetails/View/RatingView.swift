//
//  NameRatingView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit
import HCSStarRatingView

protocol RatingViewProtoco: AnyObject {
    func tabLikeButton()
}

class RatingView: UIView {

    weak var delegate: RatingViewProtoco?
    
    // MARK: - SubView
    lazy var deviceNameLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "iPhone 14 Pro Max" 
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.backgroundColor = .brandDarkBlue
        button.tintColor = .white
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var ratingStarView: HCSStarRatingView = {
        let view = HCSStarRatingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.maximumValue = 5
        view.minimumValue = 0
        view.value = CGFloat(4.5)
        view.allowsHalfStars = true
        view.starBorderColor = .ratingStarsColor
        view.tintColor = .ratingStarsColor
        view.isUserInteractionEnabled = false
        view.backgroundColor = .mainBackgroundColor
        return view
    }()

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSabViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSabViews()
    }
    
    //MARK: - Actions
    @objc func likeButtonAction() {
        delegate?.tabLikeButton()
    }
    
    // MARK: - UI
    func addSabViews() {
        backgroundColor = .mainBackgroundColor
        addSubview(deviceNameLable)
        addSubview(likeButton)
        addSubview(ratingStarView)
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            likeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            
            deviceNameLable.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            deviceNameLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            deviceNameLable.rightAnchor.constraint(equalTo: likeButton.leftAnchor, constant: -8),
            
            ratingStarView.topAnchor.constraint(equalTo: deviceNameLable.bottomAnchor, constant: 10),
            ratingStarView.leftAnchor.constraint(equalTo: deviceNameLable.leftAnchor, constant: 5),
            ratingStarView.heightAnchor.constraint(equalToConstant: 30),
            ratingStarView.widthAnchor.constraint(equalToConstant: 110),
        ])
    }
}
