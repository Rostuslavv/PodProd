//
//  MainModel.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 14.01.2023.
//

import Foundation
import UIKit

struct MasterVCModel {
    var podVCName: String?
    var detailVC: UIViewController
    
    static func fetchMasterVC() -> [MasterVCModel] {
        let test1 = MasterVCModel(podVCName: "Тестовий перший под-проект", detailVC: ViewController())
        let test2 = MasterVCModel(podVCName: "Тестовий другий под-проект", detailVC: MainTabBarController())
        let test3 = MasterVCModel(podVCName: "Тестовий третій под-проект", detailVC: TestMasterModelViewControllerTwo())
        
        return [test1, test2, test3]
    }
}
