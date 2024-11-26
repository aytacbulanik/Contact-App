//
//  PlistManager.swift
//  Contact App
//
//  Created by Aytaç Bulanık on 26.11.2024.
//

import Foundation


enum PlistError : Error {
    case parsingError
    case invalidResources
    
}


class PlistManager {
    static func parsePlist(fileName : String ) throws -> [[String : String]] {
        guard let path = Bundle.main.path(forResource: "ContactsDB", ofType: "plist") else { throw PlistError.invalidResources}
        guard let data = NSArray(contentsOfFile: path) as? [[String : String]] else {throw PlistError.parsingError}
        return data
    }
}
