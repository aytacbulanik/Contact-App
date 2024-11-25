//
//  ContactTableViewCell.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 24.11.2024.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
   
    var contact: Contact?
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        guard let contact = contact else { return }
        satirAyarla(contact: contact)
    }
    
    func satirAyarla(contact : Contact) {
        self.contact = contact
        nameLabel.text = contact.firstName + " " + contact.lastName
        avatarImage.image = UIImage(named: contact.avatarName)
        favoriteImageView.isHidden = true
    }
    
    
}
