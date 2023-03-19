//
//  MapViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 03.03.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //MARK: - Propertis
    var mapView: MapView {
        return self.view as! MapView
    }
    let locationManager = CLLocationManager()
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = MapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.map.delegate = self
        mapView.delegate = self
        configNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnable()
    }
    
    //MARK: - Functions
    func checkLocationEnable() {
        if CLLocationManager.locationServicesEnabled() {
            setupManager()
            checkAuthorization()
        } else {
            showAllertLocation(title: "У вас выключена служба геолокации",
                               message: "Хотите включить?",
                               url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func setupManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            showAllertLocation(title: "Вы запретили использование локации",
                               message: "Хотите изменить?",
                               url: URL(string: UIApplication.openSettingsURLString))
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.map.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        }
    }
    
    func showAllertLocation(title: String, message: String?, url: URL?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.map.setRegion(region, animated: true)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
       // print("Координаты - \(mapView.centerCoordinate)")
    }
}

//MARK: - MapViewProtocol
extension MapViewController: MapViewProtocol {
    func didTabSaveButton() {
        print("Координаты - \(mapView.map.centerCoordinate)")
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - NavBarConfig
extension MapViewController {
    func configNavBar() {
        let bacwardButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
            button.addTarget(self, action: #selector(bacwardButtonAction), for: .touchUpInside)
            button.setImage(UIImage(systemName: "xmark"), for: .normal)
            button.backgroundColor = .brandDarkBlue
            button.tintColor = .white
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            return button
        }()
        self.title = "Delivery address"
        navigationController?.navigationBar.tintColor = .brandDarkBlue
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bacwardButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem()
    }
    
    @objc func bacwardButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
