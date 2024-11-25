//
//  Contact.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 20.11.2024.
//

import Foundation

struct Contact : Codable {
    let firstName : String
    let lastName : String
    let phoneNumber : String
    let email : String
    let streetAddress : String
    let city : String
    let state : String
    let zip : String
    let avatarName : String
    let isFavorite : Bool?
    
    init(firstName: String, lastName: String, phoneNumber: String, email: String, streetAddress: String, city: String, state: String, zip: String, avatarName: String,isFavorite : Bool?) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.avatarName = avatarName
        self.isFavorite = isFavorite
    }
    
    var firstLetter : String {
        return firstName.prefix(1).uppercased()
    }
    
    static func getUniqueFirstLetter(from contacts: [Contact]) -> [String] {
        let uniqueLetters = contacts.map { $0.firstLetter }
        let uniqueLettersSet = Set(uniqueLetters)
        return Array(uniqueLettersSet).sorted()
    }
    
    static func getSectionedArray(from contacts : [Contact] , uniqueLetter : [String]) -> [[Contact]] {
        var resultArray = [[Contact]]()
        var newArray = [Contact]()
        for letter in uniqueLetter {
            newArray = []
            for contact in contacts {
                if contact.firstLetter == letter {
                    newArray.append(contact)
                }
            }
            if !newArray.isEmpty {
                resultArray.append(newArray)
            }
        }
        return resultArray
    }
}

extension Contact : Equatable {
    static func == (leftContact : Contact , rightContact : Contact) -> Bool {
         return leftContact.firstName == rightContact.firstName &&
        leftContact.lastName == rightContact.lastName &&
        leftContact.phoneNumber == rightContact.phoneNumber &&
        leftContact.email == rightContact.email &&
        leftContact.streetAddress == rightContact.streetAddress &&
        leftContact.city == rightContact.city &&
        leftContact.state == rightContact.state
    }
}
