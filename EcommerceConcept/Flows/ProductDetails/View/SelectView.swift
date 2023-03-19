//
//  SelectColorView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class SelectView: UIView {
    
    // MARK: - SabViews
    lazy var selectColorLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Select color and capacity"
        lable.textColor = .brandDarkBlue
        lable.font = UIFont.boldSystemFont(ofSize: 24)
        return lable
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["128GB", "256GB"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentTintColor = .brandOrange
        segment.backgroundColor = .mainBackgroundColor
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    lazy var colorButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.backgroundColor = .systemGray2
        button.tintColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var colorButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandDarkBlue
        button.tintColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSelectColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSelectColor()
    }
    //MARK: - UI
    func addSelectColor() {
        backgroundColor = .mainBackgroundColor
        addSubview(selectColorLable)
        addSubview(colorButton1)
        addSubview(colorButton2)
        addSubview(segmentControl)
        
        NSLayoutConstraint.activate([
            selectColorLable.topAnchor.constraint(equalTo: topAnchor),
            selectColorLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            colorButton1.topAnchor.constraint(equalTo: selectColorLable.bottomAnchor, constant: 20),
            colorButton1.leftAnchor.constraint(equalTo: selectColorLable.leftAnchor),
            colorButton1.widthAnchor.constraint(equalToConstant: 40),
            colorButton1.heightAnchor.constraint(equalToConstant: 40),
            
            colorButton2.topAnchor.constraint(equalTo: colorButton1.topAnchor),
            colorButton2.leftAnchor.constraint(equalTo: colorButton1.rightAnchor, constant: 20),
            colorButton2.widthAnchor.constraint(equalToConstant: 40),
            colorButton2.heightAnchor.constraint(equalToConstant: 40),
            
            segmentControl.centerYAnchor.constraint(equalTo: colorButton1.centerYAnchor),
            segmentControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            segmentControl.leftAnchor.constraint(equalTo: colorButton2.rightAnchor, constant: 8),
            segmentControl.heightAnchor.constraint(equalToConstant: 30),
            segmentControl.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
