//
//  EditProfileViewController.swift
//  MSU-Student-Link
//
//  Created by Shubham Chandna on 11/30/20.
//

import UIKit
import Parse

class EditProfileViewController: UIViewController {

    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func updateButton(_ sender: Any) {
        let user = PFUser.current()!
        if majorTextField.text != "" {
        user["major"] = majorTextField.text
        }
        if nameTextField.text != "" {
        user["firstname"] = nameTextField.text
        }
        if lastNameTextField.text != "" {
        user["lastname"] = lastNameTextField.text
        }
        if yearTextField.text != "" {
        user["schoolyear"] = yearTextField.text
        }
        
        user.saveInBackground()
        
        
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
