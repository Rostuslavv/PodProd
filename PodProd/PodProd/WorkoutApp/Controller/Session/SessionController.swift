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

        title = R.Strings.NavBarName.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBerButton(at: .left, with: R.Strings.Session.navBarLeft)
        addNavBerButton(at: .right, with: R.Strings.Session.navbarRight)
    }
    
}
