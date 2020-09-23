//
//  HelloViewController.swift
//  SafeZone-ChildApp
//
//  Created by Gado on 9/23/20.
//  Copyright © 2020 Gado. All rights reserved.
//

import UIKit
//import Firebase
import GoogleSignIn

class HelloViewController: UIViewController {


    // MARK:- Outlets
    
    @IBOutlet weak var helloLabel: UILabel!
    
    // MARK:- Properties
    
    var userName = ""
    
    // MARK:- Override Functions
    // viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello \(userName) 👋🏼"
        // Do any additional setup after loading the view.
    }
    
    // MARK:- Actions
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK:- Methods
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
