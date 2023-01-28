//
//  TimerViewModel.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 27.01.2023.
//

import SwiftUI

// Timer model And Data

class TimerData: ObservableObject {
    
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0
    
    // Animation properties...
    @Published var buttonAnimation = false
    
    // TimerView Data...
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
}
