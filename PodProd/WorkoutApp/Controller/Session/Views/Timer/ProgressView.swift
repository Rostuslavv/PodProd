//
//  ProgressView.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 30.03.2023.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        func drawProgress(with percent: CGFloat) {
            let citcleFrame = UIScreen.main.bounds.width - (30 + 120) * 2
            let radius = citcleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            layer.addSublayer(circleLayer)
        }
    }
}
