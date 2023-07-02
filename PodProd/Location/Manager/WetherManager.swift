//
//  WetherManager.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 02.07.2023.
//

import Foundation
import CoreLocation

class WetherManager {
    func getCurrentWether(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws {
        guard let url =
                URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&appid=\("abcde")&units=metric") else { fatalError("Miss URL")}
        
        let urlRequest = URLRequest(url: url)
        let(_, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching data")}
    }
}
