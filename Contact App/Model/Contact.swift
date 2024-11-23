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
}
