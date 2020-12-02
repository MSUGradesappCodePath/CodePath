//
//  CreatePostViewController.swift
//  MSU-Student-Link
//
//  Created by Jennifer Tran on 12/2/20.
//

import UIKit
import Parse

class CreatePostViewController: UIViewController {
    
    @IBOutlet weak var postTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func post(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["content"] = postTextView.text!
        post["author"] = PFUser.current()
        // i'll worry about getting time later
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error!")
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
