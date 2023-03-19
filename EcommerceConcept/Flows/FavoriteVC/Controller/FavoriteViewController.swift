//
//  FavoriteViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

class FavoriteViewController: UIViewController, FavoriteViewCellProtocol {
    
    //MARK: - Propertis
    let saveService = SaveService()
    var favoriteView: FavoriteView {
        return self.view as! FavoriteView
    }
    var products = [ProductModel]()
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = FavoriteView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.tableView.delegate = self
        favoriteView.tableView.dataSource = self
        configureNavBar()
        self.products = saveService.getFavoriteProduct()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteView.tableView.reloadData()
    }
    
    //MARK: - FavoriteViewCellProtocol
    func tabLikeButton(from cell: UITableViewCell) {
        guard let indexPath = favoriteView.tableView.indexPath(for: cell) else { return }
        saveService.deleteFavoriteProduct(product: products[indexPath.row])
        self.products.remove(at: indexPath.row)
        favoriteView.tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteViewCell.identifier, for: indexPath) as? FavoriteViewCell else { return UITableViewCell() }
        cell.delegate = self
        let model = products[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //   let product = products[indexPath.row]
        
        let addToCart = UIContextualAction(style: .destructive, title: "Add to cart") { _, _, _ in
            //Передать модель в закладки
            return
        }
        addToCart.backgroundColor = .systemGreen
        addToCart.image = {
            let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
            let image = UIImage(systemName: "cart.fill.badge.plus", withConfiguration: config)
            return image
        }()
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.saveService.deleteFavoriteProduct(product: self.products[indexPath.row])
            self.products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            return
        }
        delete.backgroundColor = .systemRed
        delete.image = {
            let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
            let image = UIImage(systemName: "trash", withConfiguration: config)
            return image
        }()
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete, addToCart])
        return swipeConfiguration
    }
}

// MARK: - NavBarConfigure
extension FavoriteViewController {
    
    private func configureNavBar() {
        let bacwardButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
            button.addTarget(self, action: #selector(bacwardButtonAction), for: .touchUpInside)
            button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
            button.backgroundColor = .brandDarkBlue
            button.tintColor = .white
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            return button
        }()
        
        let cardButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
            button.addTarget(self, action: #selector(bagButtonAction), for: .touchUpInside)
            button.setImage(UIImage(systemName: "bag"), for: .normal)
            button.backgroundColor = .brandOrange
            button.tintColor = .white
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            return button
        }()
        
        self.title = ""
        navigationController?.navigationBar.tintColor = .brandDarkBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: bacwardButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cardButton)
    }
    
    @objc func bacwardButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func bagButtonAction() {
        let myCartVC = MyCartBuilder.build()
        navigationController?.pushViewController(myCartVC, animated: true)
    }
}
