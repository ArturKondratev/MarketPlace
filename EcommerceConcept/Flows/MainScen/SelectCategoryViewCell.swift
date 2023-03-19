//
//  SelectCategoryViewCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 30.12.2022.
//

import UIKit

class SelectCategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "SelectCategoryCollectionViewCell"
    
    // MARK: - Subviews
    lazy var whiteBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 35
        return view
    }()
    
    lazy var deviceImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .gray
        return image
    }()
    
    lazy var deviceNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .brandDarkBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        deviceImage.image = nil
        deviceNameLabel.text = nil
    }
    
    // MARK: - Functions
    func configure(model: DeviceTypeModel) {
        deviceImage.image = UIImage(systemName: model.icon)
        deviceNameLabel.text = model.name
        
        whiteBottomView.backgroundColor = .white
        deviceImage.tintColor = .gray
        deviceNameLabel.textColor = .brandDarkBlue
    }
    
    func selectCell(state: Bool) {
        if state {
            whiteBottomView.backgroundColor = .brandOrange
            deviceImage.tintColor = .white
            deviceNameLabel.textColor = .brandOrange
        } else {
            whiteBottomView.backgroundColor = .white
            deviceImage.tintColor = .gray
            deviceNameLabel.textColor = .brandDarkBlue
        }
    }
    
    // MARK: - UI
    func setUI() {
        addSubview(whiteBottomView)
        addSubview(deviceImage)
        addSubview(deviceNameLabel)
        backgroundColor = .mainBackgroundColor
    
        NSLayoutConstraint.activate([
            whiteBottomView.centerXAnchor.constraint(equalTo: centerXAnchor),
            whiteBottomView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            whiteBottomView.widthAnchor.constraint(equalToConstant: 70),
            whiteBottomView.heightAnchor.constraint(equalToConstant: 70),
            
            deviceImage.centerXAnchor.constraint(equalTo: self.whiteBottomView.centerXAnchor),
            deviceImage.centerYAnchor.constraint(equalTo: self.whiteBottomView.centerYAnchor),
            deviceImage.widthAnchor.constraint(equalToConstant: 35),
            deviceImage.heightAnchor.constraint(equalToConstant: 35),
        
            deviceNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            deviceNameLabel.topAnchor.constraint(equalTo: whiteBottomView.bottomAnchor, constant: 7)
        ])
    }
}
