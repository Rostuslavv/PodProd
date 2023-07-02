//
//  UIExtension.swift
//  PodProd
//
//  Created by Rostyslav Dydiak on 02.07.2023.
//
import UIKit
import Foundation

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
