//
//  OverViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class OverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
