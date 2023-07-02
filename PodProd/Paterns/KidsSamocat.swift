//
//  KidsSamocat.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 16.06.2023.
//

import Foundation

class KidsSamocat: FabricaProtocol {
    var name: String = "Kids Samocat"
    
    var info: String = "No electro"
    
    func moving() {
        print("Moov \(name) and info \(info)")
    }
}
