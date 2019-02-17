//
//  ViewController.swift
//  ReadyER
//
//  Created by Ali Alobaidi on 2/16/19.
//  Copyright © 2019 Ali Alobaidi. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

class LoginViewController: UIViewController {
    
    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()!}}
    let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        checkLoggedIn()
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "Main")
        UIApplication.shared.keyWindow?.rootViewController = initial
    }
    
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if user != nil {
            self.performSegue(withIdentifier: "goHome", sender: nil)
        }
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    
    func checkLoggedIn() {
        self.setupLogin()
        let status = UserDefaults.standard.bool(forKey: "patientDataConfirmed") ?? false
        Auth.auth().addStateDidChangeListener{auth, user in
            if user != nil{
                print("success")
                if status {
                    self.performSegue(withIdentifier: "goToEmergencyButton", sender: nil)
                } else {
                    self.performSegue(withIdentifier: "goHome", sender: nil)
                }
                
            } else {
                print("fail")
                self.login()
            }
        }
    }
    
    func setupLogin() {
        authUI.delegate = self
        authUI.providers = providers
    }
    
    func login() {
        let authViewController = authUI.authViewController()
        //        self.present(authViewController, animated: true, completion: nil)
        self.present(authViewController, animated: true)
    }
    
}
