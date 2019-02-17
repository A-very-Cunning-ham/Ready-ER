//
//  SymptomViewController.swift
//  ReadyER
//
//  Created by Ali Alobaidi on 2/16/19.
//  Copyright © 2019 Ali Alobaidi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class CameraViewController: UIViewController {
    
    
    let imageController = UIImagePickerController()
    let patient = Patient()
    var ref: DocumentReference?
    
    
    var isId: Bool = false
    var isInsurance: Bool = false
    
    @IBOutlet weak var idImage: UIImageView!
    @IBOutlet weak var healthInsuranceCard: UIImageView!
    
    @IBAction func confirmPatientData(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "patientDataConfirmed")
        performSegue(withIdentifier: "emergency", sender: nil)
    }
    
    
    
    
    @IBAction func takeInsurancePic(_ sender: UIButton) {
        isInsurance = true
        isId = false
        present(imageController, animated: true, completion: nil)
    }
    
    @IBAction func takeIdPic(_ sender: UIButton) {
        isId = true
        isInsurance = false
        present(imageController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageController.sourceType = UIImagePickerController.SourceType.camera
        imageController.delegate = self
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if isId {
            idImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                _ = Data()
                if let data = pickedImage.jpegData(compressionQuality: 0.8) {
                    if let name = UserDefaults.standard.value(forKey: "Name") {
                        let imageRef = Storage.storage().reference().child("idImagepatients-\(name).jpeg")
                        _ = imageRef.putData(data, metadata: nil) { (metadata, error) in
                            guard let metadata = metadata else {
                                return
                            }
                            _ = metadata.size
                            imageRef.downloadURL { (url, error) in
                                guard url != nil else {
                                    return
                                }
                            }
                        }
                    }
                    
                }
            }
        } else if isInsurance {
            healthInsuranceCard.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                _ = Data()
                if let data = pickedImage.jpegData(compressionQuality: 0.8) {
                    if let name = UserDefaults.standard.value(forKey: "Name"){
                        let imageRef = Storage.storage().reference().child("healthUserInsurance-\(name).jpeg")
                        _ = imageRef.putData(data, metadata: nil) { (metadata, error) in
                            guard let metadata = metadata else {
                                return
                            }
                            _ = metadata.size
                            imageRef.downloadURL { (url, error) in
                                guard url != nil else {
                                    return
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("the camera has been closed")
    }
}
