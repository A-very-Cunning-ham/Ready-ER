//
//  Patient.swift
//  ReadyER2
//
//  Created by Ali Alobaidi on 2/17/19.
//  Copyright © 2019 Ali Alobaidi. All rights reserved.
//

import Foundation
import Firebase


class Patient {
    var name: String = ""
    var age: String = ""
    var weight: String = ""
    var sex: String = ""
    var ssNumber: String = ""
    var emergencyContactInfo: String = ""
    var pastConditions: String = ""
    var allergies: String = ""
    var medication: String = ""
    var symptoms: [String] = []
    var ref: DocumentReference?
    
    
    let currentDate = Date()
    
    
    
    func makePatient() {
        self.name = UserDefaults.standard.value(forKey: "Name") as! String
        self.age = UserDefaults.standard.value(forKey: "Age") as! String
        self.weight = UserDefaults.standard.value(forKey: "Weight") as! String
        self.sex = UserDefaults.standard.value(forKey: "Sex") as! String
        self.ssNumber = UserDefaults.standard.value(forKey: "Social Security") as! String
        self.emergencyContactInfo = UserDefaults.standard.value(forKey: "Emergency Contact") as! String
        self.pastConditions = UserDefaults.standard.value(forKey: "Past Conditions") as! String
        self.allergies = UserDefaults.standard.value(forKey: "Allergies") as! String
        self.medication = UserDefaults.standard.value(forKey: "Medication") as! String
    }
    
    func pushPatientData() {
        let db = Firestore.firestore()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let date = formatter.string(from: currentDate)
        print(date)
        db.collection("Users").addDocument(data : [
            "Name" : self.name,
            "Weight" : self.weight,
            "Age" : self.age,
            "Sex" : self.sex,
            "Emergency Contact" : self.emergencyContactInfo,
            "Social Security Number" : self.ssNumber,
            "Past Conditions" : self.pastConditions,
            "Allergies" : self.allergies,
            "Medication" : self.medication,
            "Symptoms" : self.symptoms,
            "Date" : formatter.string(from: currentDate)
        ])  { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(String(describing: self.ref?.documentID))")
            }
        }
        
    }
    
    
    
    
    func addSymptom(symptom: String) {
        self.symptoms.append(symptom)
    }
    
    
}
