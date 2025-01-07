//
//  AccountView.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState var focusTextField: FormTextField?
    
    enum FormTextField {
        case firstname, lastname, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                        TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextField, equals: .firstname)
                        .onSubmit {
                            focusTextField = .lastname
                        }
                        .submitLabel(.next)
                        TextField(
                            "Last Name", text:
                                $viewModel.user.lastName
                        )
                        .focused($focusTextField, equals: .lastname)
                        .onSubmit {
                            focusTextField = .email
                        }
                        .submitLabel(.next)
                        TextField(
                            "Email", text: $viewModel.user.email
                        )
                        .focused($focusTextField, equals: .email)
                        .onSubmit {
                            focusTextField = nil
                        }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        DatePicker(
                            "Birthday", selection: $viewModel.user.bday,
                            displayedComponents: .date
                        )
                        
                        Button {
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                    }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
                .navigationTitle("Account")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss"){
                            focusTextField = nil
                        }
                     }
                }
        }
        .onAppear {
            viewModel.retreiveUser()
        }
        .alert(item: $viewModel.alertItem) {
            alertItem in Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AccountView()
}
