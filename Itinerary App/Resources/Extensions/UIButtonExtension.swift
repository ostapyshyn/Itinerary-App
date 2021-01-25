//
//  UIButtonExtension.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 17.01.2021.
//

import UIKit

extension UIButton {
    func createFloatingActionButton() {
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}

