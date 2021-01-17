//
//  TripsViewController.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 11.01.2021.
//

import UIKit

class TripsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addButton: FloatingActionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
        view.backgroundColor = Theme.background
        //addButton.createFloatingActionButton()
        
    }
    
    func setupButton() {
        addButton.backgroundColor = Theme.tint
        addButton.layer.cornerRadius = addButton.frame.height / 2
        addButton.layer.shadowOpacity = 0.25
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
