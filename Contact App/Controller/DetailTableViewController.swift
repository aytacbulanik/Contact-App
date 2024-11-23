//
//  DetailTableViewController.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 24.11.2024.
//

import UIKit

class DetailTableViewController: UITableViewController {

    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var gelenContact : Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let gelenContact else { return }
        showContact(contact: gelenContact)
    }

    // MARK: - Table view data source
    func showContact(contact : Contact) {
        phoneNumberLabel.text = contact.phoneNumber
        zipCodeLabel.text = contact.zip
        stateLabel.text = contact.state
        cityLabel.text = contact.city
        streetLabel.text = contact.streetAddress
        emailLabel.text = contact.email
    }

   
}
