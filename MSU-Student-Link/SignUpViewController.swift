//
//  SignUpViewController.swift
//  MSU-Student-Link
//
//  Created by Ruchika Gupta on 11/27/20.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstnameField: UITextField!
    
    
    @IBOutlet weak var lastnameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBOutlet weak var majorField: UITextField!
    
    
    @IBOutlet weak var schoolyearField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = emailField.text
        user["major"] = majorField.text
        user["schoolyear"] = schoolyearField.text
        user["firstname"] = firstnameField.text
        user["lastname"] = lastnameField.text
        user.password = passwordField.text
                
        user.signUpInBackground {(success,error) in
                if success{
                        self.performSegue(withIdentifier: "signupSegue", sender: nil)
                }
                else{
                        print("error: \(String(describing: error?.localizedDescription))")
                }
                    
        }
        
    }
    
    
    @IBAction func onExistingUser(_ sender: Any) {
        //The user already exists so redirect it to the log in page
        self.performSegue(withIdentifier: "existinguserSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
