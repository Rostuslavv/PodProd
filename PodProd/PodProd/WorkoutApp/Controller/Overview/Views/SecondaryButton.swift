//
//  SecondaryButton.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 24.03.2023.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        loyoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}

private extension SecondaryButton {
    func addViews() {
        setupView(label)
        setupView(iconView)
    }
    func loyoutViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func configure() {
        backgroundColor = R.Colors.secondary
        layer.cornerRadius = 14
        makeSystem(self)
        
        label.textColor = R.Colors.active
        label.textAlignment = .center
        label.font = R.Fonts.helvelticaregular(with: 15)
        
        iconView.image = UIImage(systemName: R.Images.Common.downErrowImage)
        iconView.tintColor = R.Colors.active
    }
}
