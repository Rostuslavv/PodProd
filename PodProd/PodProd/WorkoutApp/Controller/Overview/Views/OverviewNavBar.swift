//
//  OverviewNavBar.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 25.03.2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLabel = UILabel()
    private let allWorkoutsButton = SecondaryButton()
    private let addButton = UIButton()
    
    private var weekView: UIView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: R.Colors.separator, height: 1)
    }
    
    func addAllWorkoutsButtonAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target,
                                    action: action,
                                    for: .touchUpInside)
    }
    
    func addAditingButtonAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target,
                                    action: action,
                                    for: .touchUpInside)
    }
}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        
        setupView(titleLabel)
        setupView(allWorkoutsButton)
        setupView(addButton)
        setupView(weekView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
        
        titleLabel.text = R.Strings.NavBarName.overview
        titleLabel.textColor = R.Colors.titleGray
        titleLabel.font = R.Fonts.helvelticaregular(with: 22)
                
        allWorkoutsButton.setTitle(R.Strings.OverView.allWorkoutsButton)
        addButton.setImage(UIImage(systemName: R.Images.Common.addButtonImage), for: .normal)
    }
}
