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

        title = R.Strings.NavBarName.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        
        addNavBerButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBerButton(at: .right, with: R.Strings.Progress.navbarRight)
    }
    
}
