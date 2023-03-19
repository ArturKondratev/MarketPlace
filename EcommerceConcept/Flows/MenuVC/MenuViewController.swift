//
//  MenuViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 14.01.2023.
//

import UIKit

protocol MenuVCProtocol: AnyObject {
    func didSelectRow()
}

class MenuViewController: UIViewController {
    
    var tableView: UITableView!
    weak var delegate: MenuVCProtocol?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .menuBackgroundColor
        configureTableView()
        swipeConfig()
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.size.width * 0.7,
                                 height: UIScreen.main.bounds.size.height)
        tableView.separatorStyle = .none
        tableView.rowHeight = 90
        tableView.backgroundColor = .brandDarkBlue
        tableView.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.reuseId)
        tableView.layer.cornerRadius = 18
        tableView.layer.maskedCorners = [.layerMaxXMinYCorner]
        view.addSubview(tableView)
    }
    
    func swipeConfig() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeftAction))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
   
    @objc func swipeLeftAction() {
        delegate?.didSelectRow()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.reuseId) as! MenuTableCell
        let menuModel = MenuModel(rawValue: indexPath.row)
        cell.iconImageView.image = menuModel?.image
        cell.myLabel.text = menuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectRow()
    }
}
