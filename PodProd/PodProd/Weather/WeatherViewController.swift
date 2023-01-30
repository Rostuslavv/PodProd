//
//  ViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 11.01.2023.
//

import UIKit
import Foundation
import SnapKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager: CLLocationManager = CLLocationManager()
    
    private lazy var buttonToUISplitViewController: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Get your location", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLocation()
        
        view.backgroundColor = .yellow
        setupView()
        hightMusterViewControllerIfNeeddet()
    }
    
    private func setupView() {
        buttonToUISplitViewController.addTarget(self, action: #selector(detailsButtonTapped), for: .touchUpInside)
        self.view.addSubview(buttonToUISplitViewController)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        buttonToUISplitViewController.snp.makeConstraints { make in
            make.top.equalTo(view).offset(UIConstraint.sideOffsetTop)
            make.leading.equalTo(view).offset(UIConstraint.sideOffsetLeading)
            make.trailing.equalTo(view).offset(-UIConstraint.sideOffsetTrailing)
            make.bottom.equalTo(view).offset(-UIConstraint.sideOffestBottom)
        }
    }
    
    private enum UIConstraint {
        static let sideOffsetTop = 620
        static let sideOffsetLeading = 240
        static let sideOffsetTrailing = 240
        static let sideOffestBottom = 620
    }
    
    @objc private func detailsButtonTapped() {
        //let musterViewController = MusterViewController()
        //musterViewController.modalTransitionStyle = .crossDissolve
        //musterViewController.modalPresentationStyle = .fullScreen
        //present(musterViewController, animated: false)
    }
    
    private func getLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func hightMusterViewControllerIfNeeddet() {
        if let splitViewController = self.splitViewController {
            if let navControler = splitViewController.viewControllers.last as? UINavigationController {
                navControler.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            }
        }
    }
    
    //MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(manager.location!)
        
        let currentLocation = locations.last!
        if currentLocation.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            let coords = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
            print(coords)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        print("Can't get your location!!!")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
        // here you call the function that manages the location rights at the app launch
    }
}

