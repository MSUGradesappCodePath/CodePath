
// ChatViewController.swift
// MSU-Student-Link
//
// Created by Shubham Chandna on 12/6/20.
//
import UIKit
import MessageKit
import MessageInputBar
import InputBarAccessoryView
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
class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, MessageCellDelegate, InputBarAccessoryViewDelegate {
let user = PFUser.current()!
var messageFeed = [PFObject]()
var messages = [MessageType]()
@IBOutlet weak var textField: UITextField!
@IBOutlet var onSendTapped: [UIButton]!
lazy var firstname = user.value(forKey: "firstname") as? String ?? ""
lazy var currentUser = Sender(senderId: firstname, displayName: firstname)
let otherUser = Sender(senderId: "other", displayName: "Neymar")
override func viewDidLoad() {
            super.viewDidLoad()
            messageInputBar.delegate = self
            maintainPositionOnKeyboardFrameChanged = true
            messageInputBar.inputTextView.tintColor = .yellow
            messageInputBar.sendButton.setTitleColor(.purple, for: .normal)
            messageInputBar.leftStackView.alignment = .center
            messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
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
            messagesCollectionView.messagesLayoutDelegate = self
            messagesCollectionView.messagesDisplayDelegate = self
            messagesCollectionView.messageCellDelegate = self
            // Do any additional setup after loading the view.
}
func retrieveMessages(){
    let query = PFQuery(className: "Chat")
    query.limit = 20
    // fetch data asynchronously
    query.findObjectsInBackground { (chats: [AnyObject]?, error: Error?) in
    if let chats = chats {
    // do something with the array of object returned by the call
    } else {
        print(error?.localizedDescription)
        }
    }
}

    
func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String){
    let newmessageobject = PFObject(className: "Chat")
    newmessageobject["chat_message"] = text
    //Append to messages display
    messages.append(Message(sender: currentUser,
    messageId: "6",
    sentDate: Date().addingTimeInterval(-10000),
    kind: .text(text)))
    //messages.append(text as! MessageType)
    print(messages)
    messagesCollectionView.messagesDataSource = self
    messagesCollectionView.messagesLayoutDelegate = self
    messagesCollectionView.messagesDisplayDelegate = self
    newmessageobject.saveInBackground { (success, error) in
    if success {
        print("The message was saved!")
        } else if let error = error {
            print("Problem saving message: \(error.localizedDescription)")
        }
    }
    print(messages)
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
