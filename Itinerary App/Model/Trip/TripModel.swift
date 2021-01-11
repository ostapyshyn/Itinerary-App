//
//  TripModel.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 08.01.2021.
//

import Foundation

class TripModel {
    let id: UUID
    var title: String!
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
