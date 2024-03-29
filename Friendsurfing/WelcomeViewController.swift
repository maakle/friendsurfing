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
    
    var loginManager = FBSDKLoginManager()
    //TODO: process error or result
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newFBLoginButton.delegate = self
        self.newFBLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        designFBButton()
        
        if (FBSDKAccessToken.current() != nil) {
            // User is logged in, do work such as go to next view controller. 
            
            
            
        }
        
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error?) {
        if error != nil {
            print(error!.localizedDescription)
            
            return
        }
        
        print("PENIS: \(result.token)")
        
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    print("BITCH")
                    print(result)
                    
                    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                    let menuViewController = mainStoryBoard.instantiateViewController(withIdentifier: "worldMapNavigationController")
                    self.present(menuViewController, animated: true, completion: nil)
                }
            })
        }
        
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
