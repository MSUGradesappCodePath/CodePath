# MSU Student Link

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app for students at Michigan State University to make new friends and interact with other students.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer, such as tinder or other similar apps. Functionality wouldn't be limited to mobile devices, however the viewing choice would be better on the mobile.
- **Story:** Analyzes users' majors, activities that they are going to attend, and allows other users to join them for their activities and also allows students to be randomly connected with one another each day and supports a chat functionality increasing interactiveness among students.
- **Market:** Students at Michigan State University
- **Habit:** Users get randomly matched with another user everyday. Users can check the bulletin board for any discussion or social events they can join.
- **Scope:** It's primary focus is to connect students with other students at Michigan State University. The only features are the chat box, bulletin board, and profile.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Sign Up and Login Feature to access the app
* Messaging feature between user and randomly connected user
* Profile with students' name, major, year, location
* Bulletin board and comments
* Notification of new matched user

**Optional Nice-to-have Stories**


### 2. Screen Archetypes

* Welscome screen
   * Asks user if they are an existing user or a new user and takes them to Log In or Sign Up accordingly
  
* Signup screen
   * Allows user to create an account on the app after downloading it to access its features
   * Takes in information like email, schoool year etc
   
* Login screen
   *  Upon Reopening of the application, the user is prompted to log in to gain access to their profile information to be properly matched with another person as well as witness a bulletin board with the ongoing activities.

* Match of the Day screen
   * Shows the user who they have been matched for the day and an option to check their profile
   
* Bulletin board for online events
  * Allows user to view a list of all ongoing activites and reply to a thread based on whichever activity interests them.
    
* View comments in a post
    * Allows user to view all the user interested in that particular event and their thoughts about it, allowing the student to make a well-informed decision if whether they want to attend the event or not.
    
* Profile 
    * User is able to view the other user's profile if they tap on their profile picture
 
* Editing profile
    * Allows user to upload a photo and fill in information about their major, their year and a small introduction about themselves
    
* Private messaging
    * Messaging between the user and the randomly matched user for the day
    
* Previous history chat history
    * Message history of the user's previous matches and the people they interacted with

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile
* Messaging
* Bulletin board

**Flow Navigation** (Screen to Screen)

* Welcome Screen
   * Click on Sign Up to go to the Sign Up Screen
   * Click on Log In to go to the Log In Screen
   
* Sign Up Screen
   * Click on the Create Account to go to the Login Screen
   
* Login Screen
    * After clicking on the Log In button, it takes you to the bulletin board screen 
    * Click on the messaging icon to go and see the chat history
   
* Bulletin board ->
    * Click on a user to add a comment
* Pop-up for randomly matched user 
    * Chat history (to view all your chats)
* Click on chat history user icon 
    *  View a user's profile


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups
<img src= 'https://lh3.googleusercontent.com/BkQwwe1lShQsjskKGamYqzpUpDToWIhoO6xdDPfIGGlEv2kFIe7tx1IcijYf1yG9OwWIMZ1VXvHrJgBlxvxJwfuzw0zIWshHSRc-ZK5fCzS7ZD76MtEed3aCAXeuqpk2wsKHkLe5mVYufiHxxHJwXuB9VYjFWFGmRug455m1Qv6dkXdx_UJDhOQ_te5_gKx5uTi0AeHUu-WUgTOJcfeXdwsIReDlDm0frM4oIMZCtnWfbvWBkwGaCdPpmoIQQibrm-tjIf-lPAcoHf8o4tWkxVd7CHShNiWPAx3kXcbb-kqY7XYlXRUauZ4ZnYRLV8isui1ER9dr-ogKNeitCggOMpTsQR4ZfSQfQnFtkr1N1HnCKI8TXRyvqVONgSxRX1q2NzkhLGOc9AukIFF2o0riYt0j9iBsfNKV8qW3feaB-W_ocm7V_xQummOkJtaidkKDhkMVTQJTtFB7dzU_OAzfXKvT17VP70V4R-8Er7vnNwOd_upELAlZbaRMTtMa7IvfJjH0i-L2Y1-czTyNcRmZrWaCCBpg0LPz0nJeyyG7WEXW6wLvqIHzPODS7tIuvzULdOeBwcu1X0i6KGwvdlgg0DML1caw2aJicc1W5wxm9OSEly_bLqjRfLLD9WdsTgV3ZkB18x9HXwp0YUJwWVnZUxtSE2xCdjwv8GMVOIMtmKoiy7Gi-6iP2ckitKNgZYg=w1177-h651-no?authuser=0' title='Video Walkthrough' width='' alt='Video Walkthrough' />

### [BONUS] Interactive Prototype
<img src= 'http://g.recordit.co/I2ZyaNiwZa.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Schema 
**Model: Post**
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User | image author |
   | authorName    | String | author name |
   | profilePic    | File | author's profile picture |
   | image         | File     | image that user posts |
   | caption       | String   | image caption by author |
   | createdAt     | DateTime | date when post is created (default field) |
   
  **Model: Comments**
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userName     | String   | unique id for comment by user |
   | name | String   | name of user |
   | author        | Pointer to User | comment author |
   | authorName    | String | author name |
   | profilePic    | File | author's profile picture |
   | comment       | String   | comment caption by author |
   | createdAt     | DateTime | date when comment is created (default field) |
   
 **Model: Messaging**
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userName  | String   | unique id for the user messaging (default field) |
   | name | String   | name of user |
   | senderId      | String   | unique id for the other user messaging (default field) |
   | image         | array[File]     | image that user sends |
   | message       | array[String]   | message caption by author |
   | time     | DateTime | date when message was sent (default field) |
   
 **Model: Random Matching**
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | users   | array[String]  | unique id for the user post (default field) |
   | alreadyMatched | dict{String, array[String] | dict of user matches | 
   | alreadyMatchedToday | array[String] | array of users who have already been matched today | 
   
 **Model: Account**
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userName | String   | unique id for the user post (default field) |
   | password | String | password of user’s account |
   | profileImage  | File     | user’s profile image |
   | bio      | String   | bio by user |
   | year | String  | grade level of user |
   | major | String | major of user |
   
### Networking
#### List of network requests by screen
   - Bulletin board Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
   - Sign up Screen
     - (Create/POST) Create a new user object
      ```
       @IBAction func OnSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground {(success,error) in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    ```
   - Log in Screen
    // ) Query a post where you have an author
    ```swift
      @IBAction func OnSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
       
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            //Loogged on
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("error: (error?.localizedDescription)")
            }
        }
     }
    ```
   - Inbox Screen
      - (Read/GET) Query all chats for user
          ```swift
           let query = PFQuery(className:"Chat")
           query.whereKey("author", equalTo: currentUser)
           query.order(byDescending: "createdAt")
           query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
              if let error = error { 
                 print(error.localizedDescription)
              } else if let posts = posts {
                 print("Successfully retrieved \(chats.count) chats.")
             // TODO: Do something with posts...
              }
           }
           ```
   - Private Messaging Screen
      - (Read/GET) Query all messages where user is author
      - (Read/GET) Query all messages where the user the current user is talking to is author
      - (Create/POST) Create a new message and send to other user
   - Main Screen
      - (Move/NAVIGATE) Navigate to the Login or Sign Up Screen
   - View Post Screen
      - (Read/GET) Query the individual post
          ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
   - Random Matching Screen
    - (Read/GET) Query all the accounts the user has not matched with
    ```swift
      let query = PFQuery(className:"RandomMatch")
      query.whereKey("username", equalTo: currentUser)
      query.order(byDescending: "createdAt")
      query.findObjectsInBackground { (accounts: [PFObject]?, error: Error?) in
         if let error = error {
            print(error.localizedDescription)
         } else if let posts = posts {
            print("Successfully retrieved \(posts.count) posts.")
            // TODO: Do something with posts...
         }
      }
      ```
    - (Update/PUT) Update accounts the user has not matched with
   - Edit Profile Screen
    - (Update/PUT) Update user information (bio, name, major, year)
    - (Update/PUT) Update user profile image
   
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
