//
//  PopupUIView.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 25.01.2021.
//

import UIKit

class PopupUIView: UIView {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        backgroundColor = Theme.background
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
