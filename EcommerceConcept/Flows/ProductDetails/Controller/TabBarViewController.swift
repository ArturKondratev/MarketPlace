//
//  TabBarViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class TabBarViewController: UIViewController {

    // MARK: - Properties
    private var tabBarView: TabBarView {
        return self.view as! TabBarView
    }
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = TabBarView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }

    func addTarget() {
        tabBarView.shopButton.addTarget(self, action: #selector(shopButtonAction), for: .touchUpInside)
        tabBarView.detailsButton.addTarget(self, action: #selector(detailsButtonAction), for: .touchUpInside)
        tabBarView.featuresButton.addTarget(self, action: #selector(featuresButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Functions
    @objc func shopButtonAction() {
        tabBarView.layoutIfNeeded()
        tabBarView.sliderCenterButton1.isActive = true
        tabBarView.sliderCenterButton2.isActive = false
        tabBarView.sliderCenterButton3.isActive = false
        UIView.animate(withDuration: 0.5) {
            self.tabBarView.layoutIfNeeded()
        }
    }
    
    @objc func detailsButtonAction() {
        self.tabBarView.layoutIfNeeded()
        tabBarView.sliderCenterButton1.isActive = false
        tabBarView.sliderCenterButton2.isActive = true
        tabBarView.sliderCenterButton3.isActive = false
        UIView.animate(withDuration: 0.5) {
            self.tabBarView.layoutIfNeeded()
        }
    }
    
    @objc func featuresButtonAction() {
        self.tabBarView.layoutIfNeeded()
        tabBarView.sliderCenterButton1.isActive = false
        tabBarView.sliderCenterButton2.isActive = false
        tabBarView.sliderCenterButton3.isActive = true
        UIView.animate(withDuration: 0.5) {
            self.tabBarView.layoutIfNeeded()
        }
    }
}
