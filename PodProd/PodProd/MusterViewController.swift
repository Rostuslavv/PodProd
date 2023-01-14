//
//  UISplitViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 12.01.2023.
//

import Foundation
import UIKit

protocol MasterObjectSelectedDelegate: class {
    func masterObjectSelected(masterObject: MasterVCModel)
}

class MusterViewController: UITableViewController {
    
    var masterVC = MasterVCModel.fetchMasterVC()
    
    weak var delegate: MasterObjectSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = "MusterViewController"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return masterVC.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterVC.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let currentMasterVC = masterVC[indexPath.row]
        cell.textLabel?.text = currentMasterVC.podVCName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let currentMasterVC = masterVC[indexPath.row]
        delegate?.masterObjectSelected(masterObject: currentMasterVC)
        
        switch currentMasterVC.podVCName {
        case "Тестовий перший под-проект":
            let controller = DetailViewController()
            let navigetionController = UINavigationController(rootViewController: controller)
            self.splitViewController?.showDetailViewController(navigetionController, sender: nil)
            //present(DetailViewController(), animated: true)
            
        case "Тестовий другий под-проект":
            let controller = TestMasterModelViewController()
            let navigetionController = UINavigationController(rootViewController: controller)
            self.splitViewController?.showDetailViewController(navigetionController, sender: nil)
            //present(TestMasterModelViewController(), animated: true)
            
        case "Тестовий третій под-проект":
            let controller = TestMasterModelViewControllerTwo()
            let navigetionController = UINavigationController(rootViewController: controller)
            self.splitViewController?.showDetailViewController(navigetionController, sender: nil)
            //present(TestMasterModelViewControllerTwo(), animated: true)
            
        default:
            print("error")
        }
//
//        if currentMasterVC.podVCName == "Тестовий перший под-проект" {
//            present(TestMasterModelViewController(), animated: true)
//
//            if currentMasterVC.podVCName == "Тестовий другий под-проект" {
//                present(TestMasterModelViewController(), animated: true)
//            } else if currentMasterVC.podVCName == "Тестовий третій под-проект" {
//                present(TestMasterModelViewControllerTwo(), animated: true)
//            }
//        }
        
//        controller.navigationTitle = currentMasterVC.podVCName
//        let navigetionController = UINavigationController(rootViewController: controller)
//        self.splitViewController?.showDetailViewController(navigetionController, sender: nil)
    }
}
