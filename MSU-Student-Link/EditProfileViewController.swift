//
//  EditProfileViewController.swift
//  MSU-Student-Link
//
//  Created by Shubham Chandna on 11/30/20.
//

import UIKit
import Parse
import AlamofireImage

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           profilePicture.layer.cornerRadius = profilePicture.bounds.width/2
           profilePicture.layer.borderWidth = 7
           profilePicture.layer.borderColor = UIColor.lightGray.cgColor
           
       }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        profilePicture.image = scaledImage
        dismiss(animated: true, completion: nil)
  
        
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
        let imageData = profilePicture.image?.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        user["profilepicture"] = file
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
