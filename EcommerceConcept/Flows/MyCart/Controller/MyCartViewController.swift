//
//  ViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 05.12.2022.
//

import UIKit

class MyCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var productsInCard = [CartModel](){
        didSet {
            myCardView.tableView.reloadData()
        }
    }
    
    var totalCost: Int = 0 {
        didSet {
            myCardView.tableView.reloadData()
        }
    }
    
    weak var viewController: UIViewController?
    
    // MARK: - Private Properties
    private var myCardView: MyCartView {
        return self.view as! MyCartView
    }
    private let viewModel: MyCartViewModel
    
    // MARK: - LifeCycle
    init(viewModel: MyCartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = MyCartView()
        myCardView.backgroundColor = .mainBackgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavBar()
        myCardView.tableView.dataSource = self
        myCardView.tableView.delegate = self
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadData()
    }
    
    // MARK: - Private methods
    private func bindViewModel() {
        self.viewModel.productInCart.addObserver(self) { [weak self] (products, _) in
            self?.productsInCard = products
        }
        
        self.viewModel.totalCost.addObserver(self) { [weak self] (totalCost, _) in
            self?.totalCost = totalCost
        }
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsInCard.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCartViewCell.identifier, for: indexPath) as? MyCartViewCell else { return UITableViewCell() }
        cell.delegete = self
        cell.selectionStyle = .none
        
        let model = productsInCard[indexPath.row]
        cell.configure(icon: model.product.picture.first!,
                       name: model.product.title,
                       cost: model.product.discounPrice,
                       count: model.count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyCardFooterView.identifier) as? MyCardFooterView else { return UITableViewHeaderFooterView() }
        footer.costLabe.text =  String("$ \(totalCost)")
        return footer
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myCardView.tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - MyCartViewDeleget
extension MyCartViewController: MyCartViewDeleget {
    
    func plusProduct(from cell: UITableViewCell) {
        guard let indexPath = myCardView.tableView.indexPath(for: cell) else { return }
        viewModel.plusProduct(product: productsInCard[indexPath.row])
    }
    
    func minusProduct(from cell: UITableViewCell) {
        guard let indexPath = myCardView.tableView.indexPath(for: cell) else { return }
        viewModel.minusProduct(product: productsInCard[indexPath.row])
    }
    
    func deleteProduct(from cell: UITableViewCell) {
        guard let indexPath = myCardView.tableView.indexPath(for: cell) else { return }
        viewModel.deleteProduct(product: productsInCard[indexPath.row])
    }
}

extension MyCartViewController {
    // MARK: - NavBarConfigure
    private func configureNavBar() {
        let searchLocationButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
            button.setImage(UIImage(systemName: "location.north.circle"), for: .normal)
            button.backgroundColor = .brandOrange
            button.tintColor = .white
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            button.addTarget(self, action: #selector(tapLocationButtonAction), for: .touchUpInside)
            return button
        }()
        
        let addAddressButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Add address", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            button.tintColor = .brandDarkBlue
            button.addTarget(self, action: #selector(tapLocationButtonAction), for: .touchUpInside)
            return button
        }()
        
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
        
        navigationController?.navigationBar.tintColor = .brandDarkBlue
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: searchLocationButton),
                                               UIBarButtonItem(customView: addAddressButton) ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: bacwardButton)
    }
    
    @objc func bacwardButtonAction() {
        viewModel.bacwardButtonAction()
    }
    
    @objc func tapLocationButtonAction() {
        viewModel.didTapLocationButton()
    }
}
