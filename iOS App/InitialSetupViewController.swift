//
//  InitialSetupViewController.swift
//  ReadyER2
//
//  Created by Ali Alobaidi on 2/17/19.
//  Copyright © 2019 Ali Alobaidi. All rights reserved.
//

import UIKit
import Firebase
class InitialSetupViewController: UIViewController {
    
    
    var patient = Patient()
    var ref: DocumentReference?
    
    
    
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var sexLbl: UITextField!
    @IBOutlet weak var ssLbl: UITextField!
    @IBOutlet weak var emergencyContactInfo: UITextField!
    @IBOutlet weak var pastConditionsTxt: UITextView!
    @IBOutlet weak var allergiesTxt: UITextView!
    @IBOutlet weak var medicationTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
   
    
    @IBAction func nextButton(_ sender: Any) {
        if let name = nameLbl.text,
           let age = ageText.text,
           let weight = weightTxt.text,
           let sex = sexLbl.text,
           let ss = ssLbl.text,
           let emergencyContact = emergencyContactInfo.text {
            UserDefaults.standard.set(name, forKey: "Name")
            UserDefaults.standard.set(age, forKey: "Age")
            UserDefaults.standard.set(weight, forKey: "Weight")
            UserDefaults.standard.set(sex, forKey: "Sex")
            UserDefaults.standard.set(ss, forKey: "Social Security")
            UserDefaults.standard.set(emergencyContact, forKey: "Emergency Contact")
        }
        performSegue(withIdentifier: "goToNext", sender: nil)
        
    }
    
    @IBAction func upload(_ sender: Any) {
        if let pastCondition = pastConditionsTxt.text,
        let allergies = allergiesTxt.text,
        let medication = medicationTxt.text {
            UserDefaults.standard.set(pastCondition, forKey: "Past Conditions")
            UserDefaults.standard.set(allergies, forKey: "Allergies")
            UserDefaults.standard.set(medication, forKey: "Medication")
        }
        patient.makePatient()
        performSegue(withIdentifier: "goToCamera", sender: nil)
    }
}
