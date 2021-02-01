//
//  TripsTableViewCell.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 11.01.2021.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageViewMain: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundCorners()
        imageViewMain.layer.cornerRadius = cardView.layer.cornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        imageViewMain.image = tripModel.image
    }

}
