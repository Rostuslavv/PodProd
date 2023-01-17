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
        hightMusterViewControllerIfNeeddet()
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
        //let musterViewController = MusterViewController()
        //musterViewController.modalTransitionStyle = .crossDissolve
        //musterViewController.modalPresentationStyle = .fullScreen
        //present(musterViewController, animated: false)
    }
    
    private func hightMusterViewControllerIfNeeddet() {
        if let splitViewController = self.splitViewController {
            if let navControler = splitViewController.viewControllers.last as? UINavigationController {
                navControler.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            }
        }
    }
}

