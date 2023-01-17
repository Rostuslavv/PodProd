//
//  TestMasterModelViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 14.01.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
        tabBar.backgroundColor = .brown.withAlphaComponent(0.3)
    }
    
    func setUpTabBar() {
        let scheduleViewController = createNavController(vc: ScheduleViewController(), itemName: "Schedule", ItemImage: "calendar.badge.clock")
        let tasksViewController = createNavController(vc: TasksViewController(), itemName: "Tasks", ItemImage: "text.badge.checkmark")
        let contactsViewController = createNavController(vc: ContactsViewController(), itemName: "Contacts", ItemImage: "rectangle.stack.person.crop")
        viewControllers = [scheduleViewController, tasksViewController, contactsViewController]
    }

    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController{
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }
    

}
