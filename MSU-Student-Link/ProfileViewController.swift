//
//  ProfileViewController.swift
//  MSU-Student-Link
//
//  Created by Shubham Chandna on 11/29/20.
//

import UIKit
import Parse
import AlamofireImage
import Alamofire

class ProfileViewController: UIViewController {
    
    

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var MajorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = PFUser.current()!
        let firstname = user.value(forKey: "firstname") as? String ?? ""
        let lastname =  user.value(forKey: "lastname") as? String ?? ""
        let name = (firstname + " " + lastname)
        NameLabel.text = firstname
       
        YearLabel.text = user.value(forKey: "schoolyear") as? String
        MajorLabel.text = user.value(forKey: "major") as? String
        let userImageFile = user["profilepicture"] as? PFFileObject
        userImageFile?.getDataInBackground { (imageData: Data?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let imageData = imageData {
                let image = UIImage(data:imageData)
                self.profilePicture.image = image
            }
            
        }
       
    }
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           profilePicture.layer.cornerRadius = profilePicture.bounds.width/2
           profilePicture.layer.borderWidth = 2
           profilePicture.layer.borderColor = UIColor.black.cgColor
        
       }
   
   

}
