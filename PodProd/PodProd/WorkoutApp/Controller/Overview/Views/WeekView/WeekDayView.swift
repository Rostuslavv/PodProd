//
//  WeekDayView.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 25.03.2023.
//

import UIKit

extension WeekView{
    
    final class WeekDayView: BaseView {
        
        private let namelabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
                
        func configure(with index: Int, and name: String) {
            let startWeek = Date().startOfWeek
            let currentDay = startWeek.goForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isTooday = currentDay.stritTime() == Date().stritTime()
            
            backgroundColor = isTooday ? R.Colors.active : R.Colors.background

            namelabel.text = name.uppercased()
            namelabel.textColor = isTooday ? .white : R.Colors.inActive
            dateLabel.text = "\(day)"
            dateLabel.textColor = isTooday ? .white : R.Colors.inActive
        }
    }
}

extension WeekView.WeekDayView {
    
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
        
        stackView.addArrangedSubview(namelabel)
        stackView.addArrangedSubview(dateLabel)

    }

    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
                
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        namelabel.font = R.Fonts.helvelticaregular(with: 12)
        namelabel.textAlignment = .center
        
        dateLabel.font = R.Fonts.helvelticaregular(with: 18)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
