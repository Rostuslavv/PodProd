//
//  SettingController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class SettingController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = R.Strings.NavBarName.settings
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .settings)
    }
    
}
