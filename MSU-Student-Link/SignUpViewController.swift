//
//  SignUpViewController.swift
//  MSU-Student-Link
//
//  Created by Ruchika Gupta on 11/27/20.
//

import UIKit
import AlamofireImage
import Parse

class SignUpViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var firstnameField: UITextField!
    
    
    @IBOutlet weak var userProfileView: UIImageView!
    
    @IBOutlet weak var lastnameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBOutlet weak var majorField: UITextField!
    
    
    @IBOutlet weak var schoolyearField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self // Call me back after take photo
        picker.allowsEditing = true
             
        //Checks if the camera on your phone  is available
        if UIImagePickerController.isSourceTypeAvailable(   .camera){
                 //opens up camera by default
                 picker.sourceType = .camera
        }
        else{
                 //Simulator
                 picker.sourceType = .photoLibrary
        }
             
             
        //Shows the photo album when you clcik on camera button
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           //Image comes in dic called info
           let image = info[.editedImage] as! UIImage
           //Resize the image
           let size = CGSize(width: 300, height: 300)
           let scaledImage = image.af_imageAspectScaled(toFill: size)
           //let scaledImage = image.af_imageScaled(to:size)
           
           userProfileView.image = scaledImage
           
           //Dismiss camerra view
           
           dismiss(animated: true, completion: nil)
           
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
        let imageData = userProfileView.image?.pngData()
        //! for unwrapping
        let file = PFFileObject(name: "image.png", data: imageData!)
                
        //Url to this file hwerre the image is stored
        user["profilepicture"] = file
                
               
        user.saveInBackground {  (success, error) in
                if (success){
                        self.dismiss(animated: true, completion: nil)
                        print("saved")
                }
                else{
                        print("Error")
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
