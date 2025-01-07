//
//  User.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/28/24.
//

import Foundation

struct User: Codable {
    
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var bday: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
