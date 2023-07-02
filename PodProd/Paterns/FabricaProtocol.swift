//
//  FabricaProtocol.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 16.06.2023.
//

import Foundation

protocol FabricaProtocol {
    var name: String { get }
    var info: String { get }
    
    func moving()
}
