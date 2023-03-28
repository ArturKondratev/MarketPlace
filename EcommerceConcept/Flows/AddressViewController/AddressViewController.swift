//
//  AddressViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 26.03.2023.
//

import UIKit

struct AddressModel: Codable {
    let index: Int
    var city: String
    let street: String
    let hous: Int
    let apartmentNumber: Int
    let isSelected: Bool
}

func getAddres() -> [AddressModel] {
    return [
    AddressModel(index: 123,
                 city: "Москва",
                 street: "Береговая",
                 hous: 4,
                 apartmentNumber: 50,
                 isSelected: true),
    AddressModel(index: 555,
                 city: "Чебоксары",
                 street: "Тракторостроителей",
                 hous: 54,
                 apartmentNumber: 98,
                 isSelected: false),
    AddressModel(index: 777,
                 city: "Казань",
                 street: "Новая",
                 hous: 25,
                 apartmentNumber: 4,
                 isSelected: false),
    AddressModel(index: 777,
                 city: "Химки",
                 street: "Микрорайон Планерная",
                 hous: 21,
                 apartmentNumber: 4,
                 isSelected: false)
    ]
}

class AddressViewController: UIViewController {
    
    var addressList = [AddressModel]()
    var addressView: AddressView {
        return self.view as! AddressView
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = AddressView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        addressView.tableView.delegate = self
        addressView.tableView.dataSource = self
        addressList = getAddres()
    }
}

extension AddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.identifier, for: indexPath) as? AddressTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(model: addressList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tapLocationButtonAction()
    }
    
}

extension AddressViewController {
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchLocationButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: bacwardButton)
    }
    
    @objc func bacwardButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapLocationButtonAction() {
        let vc = MapViewController()
        
        if let indexPath = addressView.tableView.indexPathForSelectedRow {
            vc.currentAddress = addressList[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
