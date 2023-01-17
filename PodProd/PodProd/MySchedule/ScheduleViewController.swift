//
//  ScheduleViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 17.01.2023.
//

import UIKit

class ScheduleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Schedule"
        
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
