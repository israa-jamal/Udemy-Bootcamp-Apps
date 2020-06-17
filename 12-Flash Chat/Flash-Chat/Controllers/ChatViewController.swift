//
//  ChatViewController.swift
//  Flash-Chat
//
//  Created by Esraa Gamal on 5/14/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    var messages : [Message] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        //registering the customzied cell
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    //displays the messages on screen
    func loadMessages(){
        
        //getting the data from firestore database
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            
            if let e = error {
                print(e)} else {
                if let snapshotDocuments = querySnapshot?.documents {
                    self.messages = []
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        //show messages one by one
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                           //refresh view every time a message is sent
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                //always view the last message
                                let indexPath = IndexPath(row: self.messages.count - 1 , section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text , let messageSender = Auth.auth().currentUser?.email
        {
            //disapears message from textField once sendButton is pressed
            DispatchQueue.main.async {
                self.messageTextfield.text = ""
                
            }
            //storing message in firetore database
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField : messageSender,
                K.FStore.bodyField : messageBody,
                K.FStore.dateField : Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print(e)
                } else {
                    print("Message is stored")
                    
                }
            }
        }
    }
    
    
    
    @IBAction func signoutPressed(_ sender: UIBarButtonItem) {
        //back directly to welcome screen once user is logged out
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
}

//MARK:- UITableViewController

extension ChatViewController : UITableViewDataSource{
    
    //the amount of cells displaying in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    //cell properties
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageBody?.text = messages[indexPath.row].body
        let message = messages[indexPath.row]
        //customizng the cell if the current user is the one who sent the message
        if  message.sender == Auth.auth().currentUser?.email
        {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBuble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageBody.textColor = UIColor(named: K.BrandColors.purple)
        }else{
            //customizng the cell if otherwise
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBuble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.messageBody.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        return cell
    }
    
    
}

