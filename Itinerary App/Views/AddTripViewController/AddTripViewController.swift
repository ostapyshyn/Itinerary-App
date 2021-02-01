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
        
        // Dropshadow
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
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
        
        TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        self.presentPhotoPickerController()
                    }
                    
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo library access is restricted and cannot be accessed", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Denied", message: "Photo library access was previously denied. Please check your settings.", preferredStyle: .alert)
                    let gotoSettings = UIAlertAction(title: "Go to settings", style: .default) { action in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alert.addAction(gotoSettings)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true, completion: nil)
                    
                case .limited:
                    break
                @unknown default:
                    break
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
