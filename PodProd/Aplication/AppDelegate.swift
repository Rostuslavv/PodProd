//
//  AppDelegate.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 11.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let musterVC = MusterViewController()
        let musterViewController = UINavigationController(rootViewController: musterVC)
        
        let detailVC = DetailViewController()
        let detailViewController = UINavigationController(rootViewController: detailVC)
        
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [musterViewController, detailViewController]
        splitViewController.preferredDisplayMode = UISplitViewController.DisplayMode.oneBesideSecondary
        splitViewController.delegate = self
        
        splitViewController.preferredPrimaryColumnWidthFraction = 0.25
        //splitViewController.maximumPrimaryColumnWidth = 600
                
        self.window?.rootViewController = splitViewController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        return true
    }
}
