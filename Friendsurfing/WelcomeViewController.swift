//
//  WelcomeViewController.swift
//  Friendsurfing
//
//  Created by Mathias Klenk on 12/11/16.
//  Copyright © 2016 Mathias Klenk. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class WelcomeViewController: UIViewController, FBSDKLoginButtonDelegate {

    //Outlets
    @IBOutlet weak var newFBLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.newFBLoginButton.delegate = self
        self.newFBLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        designFBButton()
        
        if (FBSDKAccessToken.current() != nil) {
            // User is logged in, do work such as go to next view controller.
            print("logged in")
        }
        
        // Do any additional setup after loading the view.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error?) {
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        print("BITCH")
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        try! FIRAuth.auth()?.signOut()
        print("User has been logged out!")
    }
    
    func designFBButton(){
        newFBLoginButton.layer.cornerRadius = 8
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
