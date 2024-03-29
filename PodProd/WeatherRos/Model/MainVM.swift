//
//  MainVM.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 02.07.2023.
//

import Foundation
import SwiftUI
import CoreLocation

final class MainViewModel: NSObject, ObservableObject {
    
    @Published var userLocation:  CLLocationCoordinate2D?
    var deviceLocationManager: CLLocationManager?
    
    struct AppError: Identifiable {
        let id = UUID().uuidString
        var errorString: String
    }
    
    @Published var isLoading = false
    @Published var appError: AppError? = nil
    @Published var forecasts: [Daily] = []
    @AppStorage("location") var storageLocation: String = ""
    @Published var location: String = ""
    @AppStorage("system") var system: Int = 0 {
        didSet {
            for  i in 0..<forecasts.count {
                forecasts[i].system = system
            }
        }
    }
    
    override init() {
        super.init()
        checkIfLocationSreviceIsEnabled()
        location = storageLocation
    }
    
    func checkIfLocationSreviceIsEnabled() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.deviceLocationManager = CLLocationManager()
                self.deviceLocationManager!.delegate = self
            } else {
                self.appError = AppError(errorString: NSLocalizedString("Your Location services are disabled", comment: ""))
            }
        }
    }
    
    func getWeatherForecast() {
        storageLocation = location
        
        guard self.userLocation != nil else {
            print("i am here ")
            self.forecasts = []
            return
        }
        
        self.isLoading = true
        let apiService = APIService.shared
        
        guard let latitude = self.userLocation?.latitude , let longitude = self.userLocation?.longitude else {
            print("Can not detect longitude and latitude")
            return
        }
        
        apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=current,minutely,hourly,alerts&appid=43b04eafe39d63e7cc64985fd7a8ba15",
                           dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast,APIService.APIError>) in
            print("url is :","https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=current,minutely,hourly,alerts&appid=43b04eafe39d63e7cc64985fd7a8ba15")
            switch result {
            case .success(let forecast):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.forecasts = forecast.daily.map { Daily(forecast: $0, system: self.system)}
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    //error related to api request
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.appError = AppError(errorString: errorString)
                        print(errorString)
                    }
                }
            }
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        location.fetchCityAndCountry { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.location = city
            print(city + ", " + country)
        }
    }
    
    private func checkLocationAuthorization() {
        
        guard let deviceLocationManager = deviceLocationManager else { return }
        
        switch deviceLocationManager.authorizationStatus{
        case .notDetermined:
            deviceLocationManager.requestWhenInUseAuthorization()
        case .restricted:
            self.appError = AppError(errorString: NSLocalizedString("Your Location is restricted", comment: ""))
        case .denied:
            self.appError = AppError(errorString: NSLocalizedString("This app dose not have a permission to accsses your location", comment: ""))
        case .authorizedAlways, .authorizedWhenInUse:
            self.userLocation = CLLocationCoordinate2D(latitude: deviceLocationManager.location!.coordinate.latitude, longitude:  deviceLocationManager.location!.coordinate.longitude)
            getWeatherForecast()
        @unknown default:
            break
        }
    }
}

extension MainViewModel : CLLocationManagerDelegate{
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            self.userLocation = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude:  $0.coordinate.longitude)
            getWeatherForecast()
        }
    }
}

extension CLLocation {
    
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}

