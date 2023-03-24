//
//  WorkoutTabBarController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class WorkoutTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inActive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverViewController()
        let sessionViewController = UIViewController()
        let progressController = UIViewController()
        let settingsController = UIViewController()
        
        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionViewController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingsNavigation = NavBarController(rootViewController: settingsController)

        overviewNavigation.tabBarItem = UITabBarItem(title: "Overview",
                                                     image: UIImage(systemName: Resources.Strings.TabBar.overview),
                                                     tag: Tabs.overview.rawValue)
        sessionNavigation.tabBarItem = UITabBarItem(title: "Sesion",
                                                    image: UIImage(systemName: Resources.Strings.TabBar.sesion),
                                                     tag: Tabs.session.rawValue)
        progressNavigation.tabBarItem = UITabBarItem(title: "Progress",
                                                     image: UIImage(systemName: Resources.Strings.TabBar.progress),
                                                     tag: Tabs.progress.rawValue)
        settingsNavigation.tabBarItem = UITabBarItem(title: "Settings",
                                                     image: UIImage(systemName: Resources.Strings.TabBar.settings),
                                                     tag: Tabs.settings.rawValue)
        setViewControllers([overviewNavigation,
                            sessionNavigation,
                            progressNavigation,
                            settingsNavigation
                           ], animated: false)
    }
}
