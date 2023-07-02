//
//  BaseView.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 25.03.2023.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    
    func setupViews() {}
    func constraintViews() {}
    func configureAppearance() {
        backgroundColor = .white
    }
}
