//
//  MainScenViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 13.01.2023.
//

import UIKit

class MainScenViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    lazy var selesctCategoryVC = SelectCategoryViewController(viewModel: viewModel)
    lazy var searchBarVC = SearchBarViewController(viewModel: viewModel)
    lazy var hotSealsVC = HotSalesViewController(viewModel: viewModel)
    lazy var bestSellerVC = BestSellerViewController(viewModel: viewModel)
    
    // MARK: - Private Properties
    private var mainScenView: MainScenView {
        return self.view as! MainScenView
    }
    private let viewModel: MainScenViewModel
    private var isMenuShow: Bool = false
    private var menuVC = MenuViewController()
    
    //MARK: - Init
    init(viewModel: MainScenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = MainScenView()
        view.backgroundColor = .mainBackgroundColor
        mainScenView.scrollView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.mainScenViewDidLoad()
        configureNavBar()
        configureTabBar()
        bindViewModel()
        addSabViews()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        viewModel.mainScenViewDidLoad()
        scrollToUp()
    }
    
    // MARK: - Private methods
    private func bindViewModel() {
        self.viewModel.countInCard.addObserver(self) { [weak self] (count, _) in
            if count != 0 {
                self?.mainScenView.bagButton.badge = "\(count)"
            } else {
                self?.mainScenView.bagButton.badge = nil
            }
        }
        self.viewModel.countFavorites.addObserver(self) { [weak self] ( count, _) in
            if count != 0 {
                self?.mainScenView.heartButton.badge = "\(count)"
            } else {
                self?.mainScenView.heartButton.badge = nil
            }
        }
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let verticalDistance = scrollView.contentOffset.y
        if verticalDistance > 100 {
            self.mainScenView.arrowUppButton.isHidden = false
        } else {
            self.mainScenView.arrowUppButton.isHidden = true
        }
    }
    
    @objc func scrollToUp() {
        self.mainScenView.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    //MARK: - ConfigureNavBar
    private func configureNavBar() {
        self.title = "MY SHOP"
        navigationController?.navigationBar.tintColor = .brandDarkBlue
        let filterButton = UIBarButtonItem(image: UIImage(named: "filter"),
                                           style: UIBarButtonItem.Style.plain,
                                           target: self,
                                           action: #selector(filterButtonAction))
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "Menu"),
                                         style: UIBarButtonItem.Style.done,
                                         target: self,
                                         action: #selector(menuButtonAction))
        
        self.navigationItem.rightBarButtonItem = filterButton
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    //MARK: - NavigationBar Action
    @objc func filterButtonAction() {
       
    }
    
    @objc func menuButtonAction() {
        if !isMenuShow {
            showMenu()
        } else {
            hideMenu()
        }
    }
    
    private func showMenu() {
        UIView.animate(withDuration: 0.4) {
            self.menuVC.view.frame = CGRect(x: 0,
                                            y: 100,
                                            width: UIScreen.main.bounds.size.height,
                                            height: UIScreen.main.bounds.size.height)
            self.addChildVC(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            self.isMenuShow = true
            self.menuVC.delegate = self
        }
    }
    
    private func hideMenu() {
        UIView.animate(withDuration: 0.4) {
            self.menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width,
                                            y: 100,
                                            width: UIScreen.main.bounds.size.width,
                                            height: UIScreen.main.bounds.size.height)
        } completion: { (finish) in
            self.menuVC.view.removeFromSuperview()
            self.isMenuShow = false
        }
    }
    
    //MARK: - ConfigureTabBar
    private func configureTabBar() {
        mainScenView.arrowUppButton.addTarget(self, action: #selector(scrollToUp), for: .touchUpInside)
        mainScenView.bagButton.addTarget(self, action: #selector(tabCartButtonAction), for: .touchUpInside)
        mainScenView.heartButton.addTarget(self, action: #selector(tabHeartButtonAction), for: .touchUpInside)
        mainScenView.personButton.addTarget(self, action: #selector(tabPersonButtonAction), for: .touchUpInside)
    }
    
    //MARK: - TabBar Actions
    @objc func tabCartButtonAction() {
        viewModel.tabCartButton()
    }
    
    @objc func tabHeartButtonAction() {
        viewModel.tabHeartButton()
    }
    
    @objc func tabPersonButtonAction() {
        viewModel.tabPersonButton()
    }
    
    //MARK: - UI
    func addSabViews(){
        addSelectCategoryCollectionVC()
        addSearchBarVC()
        addHotSealsVC()
        addBestSellerVC()
    }
    
    func addSelectCategoryCollectionVC() {
        addChildVC(self.selesctCategoryVC)
        NSLayoutConstraint.activate([
            selesctCategoryVC.view.topAnchor.constraint(equalTo: mainScenView.scrollView.topAnchor, constant: 10),
            selesctCategoryVC.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            selesctCategoryVC.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            selesctCategoryVC.view.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func addSearchBarVC() {
        addChildVC(self.searchBarVC)
        NSLayoutConstraint.activate([
            self.searchBarVC.view.topAnchor.constraint(equalTo: self.selesctCategoryVC.view.bottomAnchor, constant: 16),
            self.searchBarVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.searchBarVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.searchBarVC.view.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func addHotSealsVC() {
        addChildVC(self.hotSealsVC)
        NSLayoutConstraint.activate([
            self.hotSealsVC.view.topAnchor.constraint(equalTo: self.searchBarVC.view.bottomAnchor, constant: 16),
            self.hotSealsVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.hotSealsVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.hotSealsVC.view.heightAnchor.constraint(equalToConstant: 230),
        ])
    }
    
    func addBestSellerVC() {
        addChildVC(self.bestSellerVC)
      //  lazy var heightBest = CGFloat(((bestSellerVC.bestSelerProducts.count ) / 2) * 230 + 330)
        lazy var heightCV = CGFloat((5 / 2) * 230 + 330)
        NSLayoutConstraint.activate([
            self.bestSellerVC.view.topAnchor.constraint(equalTo: hotSealsVC.view.bottomAnchor, constant: 10),
            self.bestSellerVC.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.bestSellerVC.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.bestSellerVC.view.bottomAnchor.constraint(equalTo: mainScenView.scrollView.bottomAnchor),
            self.bestSellerVC.view.heightAnchor.constraint(equalToConstant: heightCV),
        ])
    }
    
    func addChildVC(_ child: UIViewController) {
        self.addChild(child)
        self.mainScenView.scrollView.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension MainScenViewController: MenuVCProtocol {
    func didSelectRow() {
        self.hideMenu()
    }
}
