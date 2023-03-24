//
//  NavBarController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configer()
    }
    
    private func configer() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor : Resources.Colors.titleGray,
            .font: Resources.Fonts.helvelticaregular(with: 17)
        ]
    }
}
