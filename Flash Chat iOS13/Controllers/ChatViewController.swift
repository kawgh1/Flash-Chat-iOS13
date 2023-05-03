//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        // register custom MessageCell xib file
        // we removed and replaced default TableView --> ReusableCell with custom MessageCell component
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        // get all user messages from firestore
        loadMessages()

    }
    
    func loadMessages() {
        db.collection(K.FireStore.messagesCollection)
            .order(by: K.FireStore.dateField)
            .addSnapshotListener { querySnapshot, error in
                
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    self.messages = []
                    // for all messages in collection
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        // if messageSender == current user
                        if let messageSender = data[K.FireStore.senderField] as? String, let messageBody = data[K.FireStore.bodyField] as? String {
                            // create new Message struct
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            // and append it to messages array []
                            self.messages.append(newMessage)
                            
                            // because the UI loads before the Firestore request is returned, we run async reload Data
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row:self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false) // scroll to bottom when new data
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FireStore.messagesCollection).addDocument(data: [ K.FireStore.senderField: messageSender,
                K.FireStore.bodyField: messageBody,
                K.FireStore.dateField: Date().timeIntervalSince1970
                             ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                } else {
                    
                    self.messageTextfield.text = ""
                    print("Successfully saved data")
                }
            }
            
        }
        
        
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}

// protocol that is responsible for populating the TableView
// - how many cells
// - which cells to put in the TableView
extension ChatViewController: UITableViewDataSource {
    
    // dynamic number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
//        cell.textLabel?.text = "This is a cell"
        cell.messageLabel.text = messages[indexPath.row].body
        
        // this is a message from the current user
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        }
        // this is a message from another user
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.blue)
        }
    
        return cell
    }
}

