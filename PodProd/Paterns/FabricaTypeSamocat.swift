//
//  FabricaTypeSamocat.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 16.06.2023.
//

import Foundation

enum TypeSamocat {
    case kidsSamocat, electroSamocat
}

class FabricaTypeSamocat {
    static let fabricaTypeSamocat = FabricaTypeSamocat()
    
    func createdSamocat(name: TypeSamocat) -> FabricaProtocol {
        switch name {
        case .electroSamocat:
            return ElectroSamocat()
        case .kidsSamocat:
            return KidsSamocat()
        }
    }
}
