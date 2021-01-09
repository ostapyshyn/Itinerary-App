//
//  TripModel.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 08.01.2021.
//

import Foundation

class TripModel {
    var id: String!
    var title: String!
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
}
