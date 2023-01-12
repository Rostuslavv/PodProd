//
//  ViewController.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 11.01.2023.
//

import UIKit
import Foundation
import SnapKit

class ViewController: UIViewController {

    private lazy var buttonToUISplitViewController: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("UISplitViewController", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        setupView()
    }
    
    private func setupView() {
        buttonToUISplitViewController.addTarget(self, action: #selector(detailsButtonTapped), for: .touchUpInside)
        self.view.addSubview(buttonToUISplitViewController)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        buttonToUISplitViewController.snp.makeConstraints { make in
            make.top.equalTo(view).offset(UIConstraint.sideOffsetTop)
            make.leading.equalTo(view).offset(UIConstraint.sideOffsetLeading)
            make.trailing.equalTo(view).offset(-UIConstraint.sideOffsetTrailing)
            make.bottom.equalTo(view).offset(-UIConstraint.sideOffestBottom)
        }
    }
    
    private enum UIConstraint {
        static let sideOffsetTop = 200
        static let sideOffsetLeading = 80
        static let sideOffsetTrailing = 80
        static let sideOffestBottom = 200
    }
    
    @objc private func detailsButtonTapped() {
        let splitViewController = UISplitViewController()
        splitViewController.modalTransitionStyle = .crossDissolve
        splitViewController.modalPresentationStyle = .fullScreen
        present(splitViewController, animated: true)
    }
}

