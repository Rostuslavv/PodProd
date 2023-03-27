//
//  SessionController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "Test", alignment: .center)
        
        return view
    }()
    
}

extension SessionController {
    override func addViews() {
        super.addViews()
        
        view.setupView(timerView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configure() {
        super.configure()

        title = R.Strings.NavBarName.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBerButton(at: .left, with: R.Strings.Session.navBarLeft)
        addNavBerButton(at: .right, with: R.Strings.Session.navbarRight)
    }
}
