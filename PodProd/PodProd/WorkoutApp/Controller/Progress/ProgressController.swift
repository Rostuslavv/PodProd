//
//  ProgressController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class ProgressController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Resources.Strings.NavBarName.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBarName.progress
        
        addNavBerButton(at: .left, with: Resources.Strings.Progress.navBarLeft)
        addNavBerButton(at: .right, with: Resources.Strings.Progress.navbarRight)
    }
    
}
