//
//  UISplitViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 12.01.2023.
//

import Foundation
import UIKit

class MusterViewController: UITableViewController {
    
    var masterVC = MasterVCModel.fetchMasterVC()
    
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
        let controller = DetailViewController()
        
        let currentMasterVC = masterVC[indexPath.row]
        controller.navigationTitle = currentMasterVC.podVCName
        let navigetionController = UINavigationController(rootViewController: controller)
        self.splitViewController?.showDetailViewController(navigetionController, sender: nil)
    }
}
