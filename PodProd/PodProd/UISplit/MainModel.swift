//
//  MainModel.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 14.01.2023.
//

import Foundation
import UIKit
import SwiftUI

struct MasterVCModel {
    var podVCName: String?
    var detailVC: UIViewController
        
    static func fetchMasterVC() -> [MasterVCModel] {
        let viewController = MasterVCModel(podVCName: "ViewController", detailVC: ViewController())
        let mySchedule = MasterVCModel(podVCName: "MySchedule", detailVC: MainTabBarController())
        let backrounfFetchingSwiftUI = MasterVCModel(podVCName: "BackrounfFetchingSwiftUI", detailVC: UIHostingController(rootView: Home()))
        
        return [viewController, mySchedule, backrounfFetchingSwiftUI]
    }
}
