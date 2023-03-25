//
//  SessionController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class SessionController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Resources.Strings.NavBarName.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBarName.session
        
        addNavBerButton(at: .left, with: Resources.Strings.Session.navBarLeft)
        addNavBerButton(at: .right, with: Resources.Strings.Session.navbarRight)
    }
    
}
