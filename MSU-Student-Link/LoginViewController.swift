//
//  LoginViewController.swift
//  MSU-Student-Link
//
//  Created by Ruchika Gupta on 11/27/20.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = emailField.text!
        let password = passwordField.text!
                
               
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            //Logged on
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("error: (error?.localizedDescription)")
            }
            }
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
