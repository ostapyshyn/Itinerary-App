//
//  TripFunctions.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 08.01.2021.
//

import Foundation

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
}
