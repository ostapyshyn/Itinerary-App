//
//  AppButton.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 25.01.2021.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = Theme.tint
    }

}
