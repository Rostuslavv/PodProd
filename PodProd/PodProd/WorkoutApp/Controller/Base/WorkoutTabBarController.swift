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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inActive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverviewController()
        let sessionViewController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingController()
        
        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionViewController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingsNavigation = NavBarController(rootViewController: settingsController)

        overviewNavigation.tabBarItem = UITabBarItem(title: "Overview",
                                                     image: UIImage(systemName: Resources.Images.TabBarImage.overviewImage),
                                                     tag: Tabs.overview.rawValue)
        sessionNavigation.tabBarItem = UITabBarItem(title: "Session",
                                                    image: UIImage(systemName: Resources.Images.TabBarImage.sessionImage),
                                                     tag: Tabs.session.rawValue)
        progressNavigation.tabBarItem = UITabBarItem(title: "Progress",
                                                     image: UIImage(systemName: Resources.Images.TabBarImage.progressImage),
                                                     tag: Tabs.progress.rawValue)
        settingsNavigation.tabBarItem = UITabBarItem(title: "Settings",
                                                     image: UIImage(systemName: Resources.Images.TabBarImage.settingsImage),
                                                     tag: Tabs.settings.rawValue)
        setViewControllers([overviewNavigation,
                            sessionNavigation,
                            progressNavigation,
                            settingsNavigation
                           ], animated: false)
    }
}
