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
