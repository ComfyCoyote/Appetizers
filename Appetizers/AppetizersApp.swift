//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
