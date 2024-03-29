//
//  ForecastVM.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 02.07.2023.
//

import CoreLocation
import Foundation
import SwiftUI

class ForecastListViewModel: ObservableObject {
    
    struct AppError :Identifiable {
        let id = UUID().uuidString
        var errorString:String
    }
    
    @Published var isLoading = false
    @Published var appError: AppError? = nil
    @Published var forecasts: [Daily] = []
    @AppStorage("location")var storageLocation: String = ""
    @Published var location: String = ""
    @AppStorage("system") var system : Int = 0 {
        didSet {
            for  i in 0..<forecasts.count{
                forecasts[i].system = system
            }
        }
    }
    
    init() {
        location=storageLocation
        getWeatherForecast()
    }
    
    func getWeatherForecast() {
        //dismiss keyboard
        UIApplication.shared.endEditing()
        //update user storage
        storageLocation = location
        
        guard !self.location.isEmpty else {
            self.forecasts = []
            return
        }
        
        self.isLoading = true
        let apiService = APIService.shared
        
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error as? CLError {
                switch error.code {
                case .locationUnknown, .geocodeFoundNoResult, .geocodeFoundPartialResult:
                    self.appError = AppError(errorString: NSLocalizedString("Unable to determine location from this text.", comment: ""))
                case .network:
                    self.appError = AppError(errorString: NSLocalizedString("You do not appear to have a network connection.", comment: ""))
                default:
                    self.appError = AppError(errorString: error.localizedDescription)
                }
                
                //error related to location
                self.isLoading = false
                print(error.localizedDescription)
            }
            
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                // Don't forget to use your own key
                apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly,alerts&appid=43b04eafe39d63e7cc64985fd7a8ba15",
                                   dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast,APIService.APIError>) in
                    switch result {
                    case .success(let forecast):
                        DispatchQueue.main.async {
                            self.isLoading=false
                            self.forecasts = forecast.daily.map { Daily(forecast: $0, system: self.system)}
                        }
                    case .failure(let apiError):
                        switch apiError {
                        case .error(let errorString):
                            //error related to api request
                            self.isLoading = false
                            self.appError = AppError(errorString: errorString)
                            print(errorString)
                        }
                    }
                }
            }
        }
    }
}

