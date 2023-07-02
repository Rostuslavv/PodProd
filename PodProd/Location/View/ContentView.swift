//
//  ContentView.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 30.06.2023.
//
import SwiftUI

struct ContentView: View {
    
    @StateObject var locationDataManager = LocationDataManagerCorect()
    
    var body: some View {
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                Text("Your current location is:")
                Text("Latitude: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
                Text("Longitude: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
            case .restricted, .denied:  // Location services currently unavailable.
                Text("Current location data was restricted or denied.")
            case .notDetermined:        // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }
    }
}
