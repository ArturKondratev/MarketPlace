//
//  PersonalAccountVC.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 01.03.2023.
//

import UIKit

class PersonalAccountVC: UIViewController {
    
    //MARK: - Propertis
    var personAccountView: PersonalAccountView {
        return self.view as! PersonalAccountView
    }
    var avatarimage: UIImage?
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = PersonalAccountView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavBar()
        personAccountView.tableView.delegate = self
        personAccountView.tableView.dataSource = self
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PersonalAccountVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 192
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalAccTableViewCell.identifier, for: indexPath) as? PersonalAccTableViewCell else { return UITableViewCell() }
        cell.accessoryType = .disclosureIndicator
        let setModel = SettingsModel(rawValue: indexPath.row)
        cell.configure(icon: setModel!.image, name: setModel!.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PersonalAccountHeaderView.identifier) as? PersonalAccountHeaderView else { return UITableViewHeaderFooterView() }
        header.delegate = self
        if avatarimage != nil {
            header.personIcon.image = avatarimage
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: PersonAccountFooterView.identifier) as? PersonAccountFooterView else { return UITableViewHeaderFooterView() }
        return footer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - PersonalAccountHeaderViewProtocol
extension PersonalAccountVC: PersonalAccountHeaderViewProtocol {
    func didTabAvatar(sender: UITapGestureRecognizer) {
        let photoImage = UIImage(systemName: "photo.on.rectangle.angled")
        let cameraImage = UIImage(systemName: "camera")
        
        let alert = UIAlertController(title: "Select image",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "Gallery", style: .default) { alert in
            self.chooseImagePicker(source: .photoLibrary)
        }
        actionPhoto.setValue(photoImage, forKey: "image")
        actionPhoto.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { alert in
            self.chooseImagePicker(source: .camera)
        }
        actionCamera.setValue(cameraImage, forKey: "image")
        actionCamera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension PersonalAccountVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            avatarimage = pickedImage
            DispatchQueue.main.async {
                self.personAccountView.tableView.reloadData()
            }
        }
        dismiss(animated: true)
    }
}

// MARK: - NavBarConfigure
extension PersonalAccountVC {
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
        
        self.title = "Profile"
        navigationController?.navigationBar.tintColor = .brandDarkBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: bacwardButton)
    }
    
    @objc func bacwardButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
