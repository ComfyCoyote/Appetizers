//
//  Alert.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id: UUID
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let responseError = AlertItem(
        id: UUID(),
        title: Text("Server Error"),
        message: Text("unable to receieve data"),
        dismissButton: .default(Text("OK"))
    )
    
    static let requestError = AlertItem(
        id: UUID(),
        title: Text("Request Error"),
        message: Text("unable to request data"),
        dismissButton: .default(Text("OK"))
    )
    
    static let formError = AlertItem(
        id: UUID(),
        title: Text("Form Error"),
        message: Text("Please fill out all items correctly"),
        dismissButton: .default(Text("OK"))
    )
    
    static let success = AlertItem(
        id: UUID(),
        title: Text("Success"),
        message: Text("Data successfully received"),
        dismissButton: .default(Text("OK"))
    )
    
}
