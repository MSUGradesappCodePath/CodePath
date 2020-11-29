//
//  ProfileViewController.swift
//  MSU-Student-Link
//
//  Created by Shubham Chandna on 11/29/20.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var MajorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = PFUser.current()
        let firstname = user?.value(forKey: "firstname") as? String ?? ""
        let lastname =  user?.value(forKey: "lastname") as? String ?? ""
        let name = (firstname + " " + lastname)
        NameLabel.text = firstname
        YearLabel.text = user?.value(forKey: "schoolyear") as? String
        MajorLabel.text = user?.value(forKey: "major") as? String
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
