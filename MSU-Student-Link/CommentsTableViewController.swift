//
//  CommentsTableViewController.swift
//  MSU-Student-Link
//
//  Created by Jennifer Tran on 12/12/20.
//

import UIKit
import Parse
import MessageInputBar

class CommentsTableViewController: UITableViewController, MessageInputBarDelegate {
    
    let commentBar = MessageInputBar()
    var showsCommentBar = false
    var post = PFObject(className: "Posts")

    override func viewDidLoad() {
        super.viewDidLoad()
        commentBar.inputTextView.placeholder = "Add a comment..."
        commentBar.sendButton.title = "Post"
        commentBar.delegate = self
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let query = PFQuery(className: "Comments")
//        query.includeKeys(["comments", "comments.author"])
//        query.limit = 20
//        query.findObjectsInBackground { (comments, error) in
//            if comments != nil {
//                self.post["comments"] = comments
//                self.tableView.reloadData()
//            }
//        }
//    }

    @objc func keyboardWillBeHidden (note: Notification){
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
    }
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        // create the comment
        let comment = PFObject(className: "Comments")
        comment["text"] = text
        comment["post"] = post
        comment["author"] = PFUser.current()
        
        post.add(comment, forKey: "comments")
        
        post.saveInBackground { (success, error) in
            if success {
                print("Comment saved")
            } else {
                print("Error saving comment")
            }
        }
        self.tableView.reloadData()
        
        // clear and dismiss the input bar
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
        commentBar.inputTextView.resignFirstResponder()
    }
    
    override var inputAccessoryView: UIView? {
        return commentBar
    }
    
    override var canBecomeFirstResponder: Bool {
        return showsCommentBar
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let comments = (post["comments"] as? [PFObject]) ?? []
        return comments.count + 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let comments = (post["comments"] as? [PFObject]) ?? []
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
            let user = post["author"] as! PFUser
            cell.nameLabel.text = (user["firstname"] as! String) + " " + (user["lastname"] as! String)
            cell.postContent.text = (post["content"] as! String)
            let imageFile = user["profilepicture"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.profileView.af_setImage(withURL: url)
            cell.commentNum.text = String(comments.count)
            
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentsLabelCell")!
            return cell
        } else if indexPath.row <= comments.count+1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            let comment = comments[indexPath.row-2]
            cell.commentLabel.text = comment["text"] as? String
            let user = comment["author"] as! PFUser
            cell.nameLabel.text = (user["firstname"] as! String) + " " + (user["lastname"] as! String)
            let imageFile = user["profilepicture"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.profileView.af_setImage(withURL: url)
        
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommentCell")!
        return cell

    }

    @IBAction func createComment(_ sender: Any) {
        showsCommentBar = true
        self.becomeFirstResponder()
        commentBar.inputTextView.becomeFirstResponder()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
