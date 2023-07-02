//
//  ElectroSamocat.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 16.06.2023.
//

import Foundation

class ElectroSamocat: FabricaProtocol {
    var name: String = "Nitebot"
    
    var info: String = "65 km"
    
    func moving() {
        print("Moov \(name) and info \(info)")
    }
}
