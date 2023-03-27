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
            
            backgroundColor = isTooday ? Resources.Colors.active : Resources.Colors.background

            namelabel.text = name.uppercased()
            namelabel.textColor = isTooday ? .white : Resources.Colors.inActive
            dateLabel.text = "\(day)"
            dateLabel.textColor = isTooday ? .white : Resources.Colors.inActive
        }
    }
}

extension WeekView.WeekDayView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        
        stackView.addArrangedSubview(namelabel)
        stackView.addArrangedSubview(dateLabel)

    }

    override func loyoutViews() {
        super.loyoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    override func configureView() {
        super.configureView()
                
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        namelabel.font = Resources.Fonts.helvelticaregular(with: 12)
        namelabel.textAlignment = .center
        
        dateLabel.font = Resources.Fonts.helvelticaregular(with: 18)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
