//
//  FloatingActionButton.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 17.01.2021.
//

import UIKit

class FloatingActionButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    

}
