//
//  TestMasterModelViewControllerTwo.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 14.01.2023.
//

import UIKit

class TestMasterModelViewControllerTwo: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TestMasterModelViewControllerTwo"
        view.backgroundColor = .blue
        
        hightMusterViewControllerIfNeeddet()
    }
    
    private func hightMusterViewControllerIfNeeddet() {
        if let splitViewController = self.splitViewController {
            if let navControler = splitViewController.viewControllers.last as? UINavigationController {
                navControler.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            }
        }
    }
}
