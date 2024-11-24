//
//  ViewController.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 20.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var contacts: [Contact] = []
    var uniqueFirstArray : [String] = []
    var sectionedArray = [[Contact]]()
    var gidenContact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        decodePlist()
    }

    func decodePlist() {
       
            if let filePath = Bundle.main.url(forResource: "ContactsDB", withExtension: ".plist") {
                if let contactData = try? Data(contentsOf: filePath){
                    let plistdecoder = PropertyListDecoder()
                    do {
                        self.contacts = try plistdecoder.decode([Contact].self, from: contactData)
                        self.contacts = self.contacts.sorted(by: { $0.firstName < $1.firstName })
                        self.uniqueFirstArray = Contact.getUniqueFirstLetter(from: self.contacts)
                        self.sectionedArray = Contact.getSectionedArray(from: self.contacts, uniqueLetter: self.uniqueFirstArray)
                        self.tableView.reloadData()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let hedefVC = segue.destination as? DetailTableViewController {
                if let secilenContact = sender as? Contact {
                    hedefVC.gelenContact = secilenContact
                }
            }
        }
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
       
        var content = cell.defaultContentConfiguration()
       
        // Configure content.
        content.image = UIImage(named: contact.avatarName)
        content.text = "\(contact.firstName) \(contact.lastName)"
        // Customize appearance.
        content.imageProperties.tintColor = .purple
        cell.contentConfiguration = content

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gidenContact = contacts[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: gidenContact)
    }
}

