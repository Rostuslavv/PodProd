//
//  MainModel.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 14.01.2023.
//

import Foundation

struct MasterVCModel {
    var podVCName: String
    
    static func fetchMasterVC() -> [MasterVCModel] {
        let test1 = MasterVCModel(podVCName: "Тестовий перший под-проект")
        let test2 = MasterVCModel(podVCName: "Тестовий другий под-проект")
        let test3 = MasterVCModel(podVCName: "Тестовий третій под-проект")
        
        return [test1, test2, test3]
    }
}
