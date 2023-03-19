//
//  SearchBarController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 08.01.2023.
//

import UIKit

class SearchBarViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Private Properties
    private let viewModel: MainScenViewModel
    private var searchBarView: SearchBarView {
        return self.view as! SearchBarView }
    
    //MARK: - LifeCycle
    init(viewModel: MainScenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        self.view = SearchBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarView.delegete = self
        searchBarView.textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBarView.textField.text = ""
    }
    
    //MARK: - UItextFieldDelegates
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        viewModel.searchBarAction(text: "")
        self.searchBarView.textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            viewModel.searchBarAction(text: text)
        }
        self.searchBarView.textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            viewModel.searchBarAction(text: text)
        }
        if string == "" {
            viewModel.searchBarAction(text: "")
        }
        return true
    }
}

//MARK: - SearchBarViewDelegete
extension SearchBarViewController: SearchBarViewDelegete {
    func serchBattonAction(text: String) {
        viewModel.searchBarAction(text: text)
        self.searchBarView.textField.resignFirstResponder()
    }
}
