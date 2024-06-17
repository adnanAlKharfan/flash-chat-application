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
class ChatViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var msg:[message] = [
      
    ]
    


    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextfield.delegate=self
        title="flash chat"
        tableView.dataSource=self
        navigationItem.hidesBackButton=true
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        db.collection("messages").order(by: "date").addSnapshotListener{
            (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                    
                        var temp:message? = message ( sender:  document.data()["sender"] as! String , body: document.data()["body"] as! String,document.documentID)
                        var b=true
                        
                        for m in self.msg {
                            print(m.id)
                            if m.id==temp?.id{
                                b=false
                            }
                        }
                        if b {
                        self.msg.append(temp!)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let index=IndexPath(row: self.msg.count-1, section: 0)
                            self.tableView.scrollToRow(at: index, at: .top, animated: true)
                        }}
                        }
                }}
        
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        messageTextfield.text=""
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        var ref: DocumentReference? = nil
        ref = db.collection("messages").addDocument(data: ["sender":Auth.auth().currentUser?.email,"body":messageTextfield.text,"date":Date().timeIntervalSince1970]){ err in
            
            self.messageTextfield.endEditing(true)
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    @IBAction func Log_out(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        
        navigationController?.popToRootViewController(animated: true)
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    
}

extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "ReusableCell",for: indexPath) as! MessageCell
        cell.label?.text=msg[indexPath.row].body
        print(msg[indexPath.row].sender)
        if msg[indexPath.row].sender == Auth.auth().currentUser?.email{
            cell.firstImage.isHidden=true
            cell.messageBox.backgroundColor=UIColor.blue
        }
        else{
            cell.secondImage.isHidden=true
        }
        return cell
    }
    
    
    
}
