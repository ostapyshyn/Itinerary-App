//
//  AddTripViewController.swift
//  Itinerary App
//
//  Created by Volodymyr Ostapyshyn on 22.01.2021.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        imageView.layer.cornerRadius = 10
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
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        let myPickerController = UIImagePickerController()
                        myPickerController.delegate = self
                        myPickerController.sourceType = .photoLibrary
                        self.present(myPickerController, animated: true, completion: nil)
                    }
                    
                default:
                    break
                //                case .notDetermined:
                //
                //                case .restricted:
                //
                //                case .denied:
                //
                //                case .limited:
                //
                //                @unknown default:
                //
                //                }
                }
            }
            
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
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
