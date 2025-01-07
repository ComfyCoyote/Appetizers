//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alert: AlertItem?
    @Published var loading: Bool = true
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            switch result {
            case .success(let appetizers):
                self.appetizers = appetizers
                self.loading = false
            case .failure(let error):
                self.loading = false
                switch error {
                case NetworkError.invalidResponse:
                    self.alert = AlertContext.responseError
                case NetworkError.invalidData:
                    self.alert = AlertContext.responseError
                case NetworkError.unableToComplete:
                    self.alert = AlertContext.responseError
                case NetworkError.invalidURL:
                    self.alert = AlertContext.requestError
                    
                default:
                    self.alert = AlertContext.responseError
                }
            }
        }
    }
    
    func getAppetizersAsync() {
        loading = true
        
        Task {
            
            do {
                appetizers = try await NetworkManager.shared.getAppetizersAsync()
                loading = false
            } catch {
                alert = AlertContext.responseError
                loading = false
            }
            
        }
        
    }
}
