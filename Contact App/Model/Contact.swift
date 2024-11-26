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
    
    var firstLetter : String {
           return String(firstName.prefix(1))
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
