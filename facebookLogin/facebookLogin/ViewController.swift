//
//  ViewController.swift
//  facebookLogin
//
//  Created by Danny Glover on 9/23/14.
//  Copyright (c) 2014 Danny Glover. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        println("User is logged in")
        println("This is where to prepare a segue")

    }
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        println("logged user: \(user.name)")
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        println("User logged out")
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
            println("Error: \(error.localizedDescription)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

