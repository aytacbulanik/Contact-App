//
//  ViewController.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 20.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var contactSource = ContactSource.contacts
    var sectionedArray : [[Contact]] = ContactSource.sectinedContacts
    var uniqueFirstArray : [String] = ContactSource.uniqueFirstLetter
    var gidenContact: Contact!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let hedefVC = segue.destination as? DetailTableViewController {
                if let secilenContact = sender as? Contact {
                    hedefVC.delegate = self
                    hedefVC.gelenContact = secilenContact
                }
            }
        }
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return uniqueFirstArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  sectionedArray[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ContactSource.uniqueFirstLetter[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ContactSource.uniqueFirstLetter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = sectionedArray[indexPath.section][indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactTableViewCell {
            cell.satirAyarla(contact: contact)
            return cell
        } else {
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gidenContact = sectionedArray[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: gidenContact)
    }
}

extension ViewController : ContactDetailDelegate {
    func sendChosenContact(contact: Contact) {
        print(contact.firstName)
    }
    
    
}

