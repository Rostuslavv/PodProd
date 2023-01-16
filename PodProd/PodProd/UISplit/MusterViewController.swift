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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = "MusterViewController"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //tableView.allowsMultipleSelection = false --- ПРОЧИТАТИ ПРО ЦЕ
        //tableView.allowsSelection = true --- ПРОЧИТАТИ ПРО ЦЕ
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return masterVC.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterVC.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.selectionStyle = .gray --- ПРОЧИТАТИ ПРО ЦЕ
        let currentMasterVC = masterVC[indexPath.row]
        cell.textLabel?.text = currentMasterVC.podVCName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        let currentMasterVC = masterVC[indexPath.row]
        controller.navigationTitle = "\(currentMasterVC)"
        
        switch currentMasterVC.podVCName {
        case "Тестовий перший под-проект":
            setUpPresentViewController(viewController: currentMasterVC.detailVC)
        case "Тестовий другий под-проект":
            setUpPresentViewController(viewController: currentMasterVC.detailVC)
        case "Тестовий третій под-проект":
            setUpPresentViewController(viewController: currentMasterVC.detailVC)
        default:
            print("error")
        }
        //tableView.deselectRow(at: indexPath, animated: false) --- ПРОЧИТАТИ ПРО ЦЕ
    }
    
    private func setUpPresentViewController(viewController: UIViewController) {
        let navigetionController = UINavigationController(rootViewController: viewController)
        splitViewController?.showDetailViewController(navigetionController, sender: nil)
    }
}
