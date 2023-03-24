//
//  BaseController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
}

@objc extension BaseController {
    
    func addViews() {}
    func layoutViews() {}
    
    func configure() {
        view.backgroundColor = Resources.Colors.background
    }
}
