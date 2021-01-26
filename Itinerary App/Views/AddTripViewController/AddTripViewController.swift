//
//  AddTripViewController.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 22.01.2021.
//

import UIKit

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
            //let image = UIImage(systemName: "envelope")
            // https://medium.com/nyc-design/swift-4-add-icon-to-uitextfield-48f5ebf60aa1
            let image = UIImage(named: "newWarn") 
            
            let iconView = UIImageView(frame: CGRect(x: 5, y: 5, width: 20, height: 20))
            iconView.image = image
            
            let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
               iconContainerView.addSubview(iconView)
            tripTextField.rightView = iconContainerView
            tripTextField.rightViewMode = .always
            tripTextField.tintColor = .red // color of image inside
            
            
            return
        }
        
        TripFunctions.createTrip(tripModel: TripModel(title: newTripName))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
