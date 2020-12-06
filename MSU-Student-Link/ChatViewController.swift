//
//  ChatViewController.swift
//  MSU-Student-Link
//
//  Created by Shubham Chandna on 12/6/20.
//

import UIKit
import MessageKit
import Parse

struct Sender: SenderType{
    var senderId: String
    var displayName: String
}

struct Message: MessageType{
    var sender: SenderType
    var messageId: String
    
    var sentDate: Date
    var kind: MessageKind
    
    
}
class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    let user = PFUser.current()!
    var messageFeed = [PFObject]()
    var messages = [MessageType]()
    lazy var firstname = user.value(forKey: "firstname") as? String ?? ""
    lazy var currentUser = Sender(senderId: firstname, displayName: firstname)
    let otherUser = Sender(senderId: "other", displayName: "Neymar")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstname = user.value(forKey: "firstname") as? String ?? ""
        let currentUser = Sender(senderId: firstname, displayName: firstname)
        let otherUser = Sender(senderId: "other", displayName: "Neymar")
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hi there")))
        messages.append(Message(sender: otherUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-70000),
                                kind: .text("Hey")))
        messages.append(Message(sender: currentUser,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-50000),
                                kind: .text("I am good. How are you?")))
        messages.append(Message(sender: otherUser,
                                messageId: "4",
                                sentDate: Date().addingTimeInterval(-40000),
                                kind: .text("Awesome!")))
        messages.append(Message(sender: currentUser,
                                messageId: "5",
                                sentDate: Date().addingTimeInterval(-20000),
                                kind: .text("Let's build the app")))
        messages.append(Message(sender: otherUser,
                                messageId: "6",
                                sentDate: Date().addingTimeInterval(-10000),
                                kind: .text("Great")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate =  self
        messagesCollectionView.messagesDisplayDelegate =  self
      
  

        // Do any additional setup after loading the view.
    }
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }


}
