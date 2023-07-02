//
//  TimerView.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 30.03.2023.
//

import UIKit

final class TimerView: WABaseInfoView {
    
    private let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgress(with: 0.6)
        return view
    }()
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        
        setupView(progressView)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()

    }
}
