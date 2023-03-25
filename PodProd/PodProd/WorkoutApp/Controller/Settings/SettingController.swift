//
//  SettingController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class SettingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Resources.Strings.NavBarName.settings
        navigationController?.tabBarItem.title = Resources.Strings.TabBarName.settings
    }
    
}
