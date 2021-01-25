//
//  UIViewExtensions.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 12.01.2021.
//

import UIKit

extension UIView {
    func addShadowAndRoundCorners() {
       layer.shadowOpacity = 1
       layer.shadowOffset = CGSize.zero
       layer.shadowColor = UIColor.darkGray.cgColor
       layer.cornerRadius = 10
    }
}
