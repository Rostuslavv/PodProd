//
//  DetailViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 12.01.2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
//    var masterObject: MasterVCModel? {
//        didSet {
//            setMasterObject()
//        }
//    }
//
    
    var navigationTitle = "DetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        self.navigationController?.navigationBar.prefersLargeTitles = true
        hightMusterViewControllerIfNeeddet()
    }
    
//    private func setMasterObject() {
//        loadViewIfNeeded()
//    }
    
    private func hightMusterViewControllerIfNeeddet() {
        if let splitViewController = self.splitViewController {
            if let navControler = splitViewController.viewControllers.last as? UINavigationController {
                navControler.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            }
        }
    }
}

//extension DetailViewController: MasterObjectSelectedDelegate {
//    func masterObjectSelected(masterObject: MasterVCModel) {
//        self.masterObject = masterObject
//    }
//}
