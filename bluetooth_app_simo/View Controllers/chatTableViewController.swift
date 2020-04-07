//
//  chatTableViewController.swift
//  bluetooth_app_simo
//
//  Created by Simone  on 06/04/2020.
//  Copyright © 2020 Simone . All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class chatTableViewController: UITableViewController {
    
    var users = [User]  ()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UserCell.self, forCellReuseIdentifier: "cellId")
        fetchUsers()

    }
    //Func per connersi al nostro database e scaricare tutti gli utenti in users e metterli nell'array creato apposta
    func fetchUsers(){
        let db = Firestore.firestore()
        db.collection("users").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                 print("Error fetching documents: \(error!)")
                 return
             }
            for document in documents{
                let user = User (name: document.data()["name"] as! String, email: document.data()["email"] as! String)
                self.users.append(user)
                DispatchQueue.main.async {self.tableView.reloadData()}
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  users.count
    }
    
    //Func per caricare i dati correnti nella table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        let user = users[indexPath.row]
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = user.email
        return cell!
    }
}

//creazione classa personalizzata per gli elementi nella table views
class UserCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has non been implemented")
    }
}

