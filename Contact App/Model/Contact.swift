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
    var isFavorite : Bool
    
    
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

extension Contact {
    struct Key {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let phoneNumber = "phoneNumber"
        static let email = "email"
        static let street = "streetAddress"
        static let state = "state"
        static let city = "city"
        static let zip = "zip"
        static let avatarName = "avatarName"
    }
    init?(data : [String : String]) {
        guard let firstNameData = data[Key.firstName] ,
              let lastNameData = data[Key.lastName] ,
              let phoneData = data[Key.phoneNumber] ,
              let emailData = data[Key.email] ,
              let streetData = data[Key.street] ,
              let stateData = data[Key.state] ,
              let cityData = data[Key.city] ,
              let zipData = data[Key.zip],
        let avatarData = data[Key.avatarName] else {
            return nil
        }
        firstName = firstNameData
        lastName = lastNameData
        phoneNumber = phoneData
        email = emailData
        streetAddress = streetData
        state = stateData
        city = cityData
        zip = zipData
        avatarName = avatarData
        isFavorite = false
    }
}
class PlistLoader {
    static func plistLoaderArray() throws -> [[String : String]] {
        guard let path = Bundle.main.path(forResource: "ContactsDB", ofType: "plist") else {fatalError()}
        guard let data = NSArray(contentsOfFile: path) as? [[String : String]] else {fatalError()}
        return data
    }
}

class ContactSource {
    static var contacts : [Contact] {
        let data = try! PlistLoader.plistLoaderArray()
        return data.compactMap {Contact(data: $0)}
    }
}
