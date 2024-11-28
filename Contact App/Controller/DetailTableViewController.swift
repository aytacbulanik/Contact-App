//
//  DetailTableViewController.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 24.11.2024.
//

import UIKit

protocol ContactDetailDelegate {
    func sendChosenContact(contact: Contact)
}

class DetailTableViewController: UITableViewController {

    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var markFavoriteButtonOut: UIButton!
    
    var gelenContact : Contact?
    var delegate : ContactDetailDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        showContact()
    }

    // MARK: - Table view data source
    func showContact() {
        guard let gelenContact else { return }
        phoneNumberLabel.text = gelenContact.phoneNumber
        zipCodeLabel.text = gelenContact.zip
        stateLabel.text = gelenContact.state
        cityLabel.text = gelenContact.city
        streetLabel.text = gelenContact.streetAddress
        emailLabel.text = gelenContact.email
        avatarImageView.image = UIImage(named: gelenContact.avatarName)
        nameLabel.text = "\(gelenContact.firstName) \(gelenContact.lastName)"
        if gelenContact.isFavorite {
            markFavoriteButtonOut.setTitle("Remove from Favorites", for: .normal)
        } else {
            markFavoriteButtonOut.setTitle("Mark add to Favorites", for: .normal)
        }
    }

    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
       guard let gelenContact else { return }
        
        self.gelenContact?.isFavorite = !gelenContact.isFavorite
        
        if (self.gelenContact?.isFavorite)! {
            markFavoriteButtonOut.setTitle("Remove from Favorites", for: .normal)
        } else {
            markFavoriteButtonOut.setTitle("Mark add to Favorites", for: .normal)
        }
        delegate?.sendChosenContact(contact: self.gelenContact!)
    }
    
}
