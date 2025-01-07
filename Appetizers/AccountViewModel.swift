//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/28/24.
//

import Foundation
import SwiftUI


final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user: User = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.formError
            
            return false
            
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.formError
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.success
        } catch {
            alertItem = AlertContext.requestError
        }
    }
    
    func retreiveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.requestError
        }
        
    }

}
