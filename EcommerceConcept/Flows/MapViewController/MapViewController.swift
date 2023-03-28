//
//  MapViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 03.03.2023.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    //MARK: - Propertis
    var currentAddress: AddressModel?
    let annotationIdentifier = "annotationIdentifier"
    let locationManager = CLLocationManager()
    let regionInMeters = 1000.00
    var mapView: MapView {
        return self.view as! MapView
    }
    var streetName = ""
    var buildNum = ""
    var saveService = SaveService()
    
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
        setupAddressLocation()
    }
    
    //MARK: - Functions
    func setupAddressLocation() {
        guard let location = currentAddress?.city,
              let street = currentAddress?.street,
              let house = currentAddress?.hous
        else { return }

        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("\(location), \(street), \(house)") { (placemarks, error) in
            if let error = error {
                print(error)
                return
            }
            guard let placemarks = placemarks else { return }
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = self.currentAddress?.city
            annotation.subtitle = self.currentAddress?.street
            
            guard let placemarkLocation = placemark?.location else { return }
            
            annotation.coordinate = placemarkLocation.coordinate

            self.mapView.map.showAnnotations([annotation], animated: true)
            self.mapView.map.selectAnnotation(annotation, animated: true)
        }
    }
    
    
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
            showAllertLocation(title: "Вы запретили использование локации",
                               message: "Хотите изменить?",
                               url: URL(string: UIApplication.openSettingsURLString))
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
        @unknown default:
            return
        }
    }
    
    func showAllertLocation(title: String, message: String?, url: URL?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alert) in
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: regionInMeters,
                                            longitudinalMeters: regionInMeters)
            mapView.map.setRegion(region, animated: true)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        if let image = UIImage(systemName: "house") {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imageView.image = image
            annotationView?.rightCalloutAccessoryView = imageView
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: self.mapView.map)
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(center) {(placmark, error) in
            if let error = error {
                print(error)
                return
            }
            guard let placmarks = placmark else { return }
            let placmark = placmarks.first
            let streetName = placmark?.thoroughfare
            let buildNumber = placmark?.subThoroughfare
            
            DispatchQueue.main.async {
                if streetName != nil, buildNumber != nil {
                    self.mapView.addressLable.text = "\(streetName!), \(buildNumber!)"
                    self.streetName = streetName!
                    self.buildNum = buildNumber!
                } else if streetName != nil {
                    self.mapView.addressLable.text = "\(streetName!)"
                } else {
                    self.mapView.addressLable.text = ""
                }
            }
        }
    }
}

//MARK: - MapViewProtocol
extension MapViewController: MapViewProtocol {
    func didTabSaveButton() {
        let addres = AddressModel(index: 0,
                                  city: "",
                                  street: self.streetName,
                                  hous: Int(buildNum) ?? 0,
                                  apartmentNumber: 54,
                                  isSelected: true)
        self.saveService.saveDeliveryAddress(address: addres)
        navigationController?.popViewController(animated: true)
    }
    
    func didTabNavigationButton() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: regionInMeters,
                                            longitudinalMeters: regionInMeters)
            mapView.map.setRegion(region, animated: true)
        }
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
