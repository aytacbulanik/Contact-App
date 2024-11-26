//
//  ContactSource.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 27.11.2024.
//

import Foundation

class ContactSource {
    static var contacts : [Contact] {
        let data = try! PlistManager.parsePlist(fileName: "ContactsDB")
        return data.compactMap {Contact(data: $0)}
    }
    
    static var uniqueFirstLetter : [String] {
        let firstLetters = contacts.map { $0.firstName }
        let uniqueLetters = Set(firstLetters)
        return Array(uniqueLetters).sorted()
        }
    
        static var sectinedContacts : [[Contact]] {
            return uniqueFirstLetter.map { firstName in
                let filteredContacts = contacts.filter { $0.firstName == firstName }
                return filteredContacts.sorted(by: {$0.firstName < $1.firstName})
            }
        }

}
