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
        let weatherViewController = MasterVCModel(podVCName: "Weather", detailVC: WeatherViewController())
        let mySchedule = MasterVCModel(podVCName: "MySchedule", detailVC: MainTabBarController())
        let backrounfFetchingSwiftUI = MasterVCModel(podVCName: "BackrounfFetchingSwiftUI", detailVC: UIHostingController(rootView: Home()))
        let workoutTabBarController = MasterVCModel(podVCName: "WorkoutTabBarController", detailVC: WorkoutTabBarController())
        let fabricaViewController = MasterVCModel(podVCName: "FabricaStoryboard", detailVC: FabricaViewController())
        let weatherView = MasterVCModel(podVCName: "WelcomeView", detailVC: UIHostingController(rootView: MainView()))
        
        return [weatherViewController,
                mySchedule,
                backrounfFetchingSwiftUI,
                workoutTabBarController,
                fabricaViewController,
                weatherView
        ]
    }
}
