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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        decodePlist()
       
    }

    func decodePlist() {
        DispatchQueue.main.async {
            if let filePath = Bundle.main.url(forResource: "ContactsDB", withExtension: ".plist") {
                if let contactData = try? Data(contentsOf: filePath){
                    let plistdecoder = PropertyListDecoder()
                    do {
                        self.contacts = try plistdecoder.decode([Contact].self, from: contactData)
                        self.tableView.reloadData()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.imageView?.layer.cornerRadius = 50
        var content = cell.defaultContentConfiguration()
       

        // Configure content.
        content.image = UIImage(named: contact.avatarName)
        content.text = "\(contact.firstName) \(contact.lastName)"
       

        // Customize appearance.
        content.imageProperties.tintColor = .purple


        cell.contentConfiguration = content

        return cell
    }
}

