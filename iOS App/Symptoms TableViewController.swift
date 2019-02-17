//
//  Symptoms TableViewController.swift
//  ReadyER2
//
//  Created by Ali Alobaidi on 2/17/19.
//  Copyright © 2019 Ali Alobaidi. All rights reserved.
//

import UIKit
import Firebase

class Symptoms_TableViewController: UITableViewController {

    var isChecked: Bool = false
    let cell = TableViewCell()
    var patient = Patient()
    
    
    let symptoms = ["Pain or discomfort",
                    "Lump or bulge",
                    "Muscle cramps or spasms (painful)",
                    "Numbness or tingling",
                    "Bloating or fullness",
                    "Joint pain",
                    "Itching or burning",
                    "Swelling",
                    "Tenderness to touch",
                    "Muscle cramps or spasms (painful), Pain or discomfort",
                    "Bruising or discoloration",
                    "Headache",
                    "Dizziness",
                    "Bleeding",
                    "Cough",
                    "Nausea or vomiting",
                    "Pain or discomfort, Tenderness to touch",
                    "Drainage or pus",
                    "Diarrhea",
                    "Stiffness or decreased movement",
                    "Change in bowel habits",
                    "Enlarged or swollen glands",
                    "Difficulty swallowing",
                    "Pain or discomfort, Pain or discomfort",
                    "Numbness or tingling, Pain or discomfort",
                    "Lump or bulge, Pain or discomfort",
                    "Sore throat",
                    "Skin rash",
                    "Bloating or fullness, Change in bowel habits",
                    "Fatigue",
                    "Fever",
                    "Frequent urge to urinate",
                    "Warm to touch",
                    "Pressure or fullness",
                    "Pain or discomfort, Stiffness or decreased movement",
                    "Ear ache",
                    "Bloating or fullness, Pain or discomfort",
                    "Cloudy urine with strong odor",
                    "Vaginal discharge",
                    "Body aches or pains",
                    "Pain or discomfort, Swelling",
                    "Constipation",
                    "Distended stomach",
                    "Nausea or vomiting, Pain or discomfort",
                    "Visible deformity",
                    "Bloating or fullness, Distended stomach",
                    "Headache (worst ever)",
                    "Anxiety",
                    "Bloating or fullness, Change in bowel habits, Constipation, Distended stomach",
                    "Nasal congestion"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
        tableView.allowsMultipleSelection = true
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.title = "Choose your Symptoms"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return symptoms.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .checkmark
                let symptom = symptoms[indexPath.row]
                patient.addSymptom(symptom: symptom)
                print(symptoms[indexPath.row])
                tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    @IBAction func nextButton(_ sender: Any) {
        patient.makePatient()
        patient.pushPatientData()
        performSegue(withIdentifier: "goToMore", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        cell.textLabel?.text = symptoms[indexPath.row]
        return cell
    }
    
}
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


