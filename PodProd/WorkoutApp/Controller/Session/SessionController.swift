//
//  SessionController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: TimerView = {
        let view = TimerView(with: "wgewb")
        return view
    }()
    
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timerView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()

        title = R.Strings.NavBarName.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBerButton(at: .left, with: R.Strings.Session.navBarLeft)
        addNavBerButton(at: .right, with: R.Strings.Session.navbarRight)
    }
}
