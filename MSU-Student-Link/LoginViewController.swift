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
        //Size of blu view equal to size of overall view
        blurView.bounds = self.view.bounds
        popupView.bounds = CGRect(x: 0, y: 0, width:self.view.bounds.width * 0.9 , height: self.view.bounds.height * 0.4)
        // Do any additional setup after loading the view.
    }
    
    func animateIn(desiredView: UIView){
        let backgroundView = self.view
        //add desired screen to the actual screen
        backgroundView?.addSubview(desiredView)
        
        //sets the view scaling to be 120%
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        
        //set the center as background view
        desiredView.center = backgroundView!.center
        
        //After 0.3 seconds do the animation
        UIView.animate(withDuration: 0.3, animations:   {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    func animateOut(desiredView:UIView){
        UIView.animate(withDuration: 0.3, animations:   {
            //Go back to original
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            //After animation run the completion code
        }, completion: { _ in
            //remove desired view from the background
            desiredView.removeFromSuperview()
        })
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "SignupSegue", sender: nil)
    }
    
    @IBOutlet var popupView: UIView!
    
    @IBOutlet var blurView: UIVisualEffectView!
    
    @IBAction func closePopUp(_ sender: Any) {
        //Animate out the view
        animateOut(desiredView: popupView)
        animateOut(desiredView: blurView)
        //Perform the login segue once the user closes out of the pop up
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = emailField.text!
        let password = passwordField.text!
                
               
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            //Logged on
            if user != nil {
                
                //Bring up pop up screen
                self.animateIn(desiredView: self.blurView)
                self.animateIn(desiredView: self.popupView)
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
