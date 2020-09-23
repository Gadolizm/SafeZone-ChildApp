//
//  ViewController.swift
//  SafeZone-ChildApp
//
//  Created by Gado on 9/7/20.
//  Copyright © 2020 Gado. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController {


    
    // MARK:- Outlets
    
    
    // MARK:- Properties
    
    // MARK:- Override Functions
    // viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self  // If AppDelegate conforms to GIDSignInDelegate

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        //GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        // ...

    }
    
    // MARK:- Actions
    
    @IBAction func signInButtonTapped(_ sender: Any) {
    }
    
    // MARK:- Methods


}

extension SignInViewController : GIDSignInDelegate{
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
      let userId = user.userID                  // For client-side use only!
      let idToken = user.authentication.idToken // Safe to send to the server
      let fullName = user.profile.name
      let givenName = user.profile.givenName
      let familyName = user.profile.familyName
      let email = user.profile.email
      // ...
        //1 Instantiating ViewController2 from storyboard
        let vc2 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HelloViewController") as! HelloViewController
        //2 pushing ViewController2 to move to top of the navigation stack
        self.navigationController?.pushViewController(vc2, animated: true)
        vc2.userName = fullName!
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
      // Perform any operations when the user disconnects from app here.
      // ...
    }
    
}





