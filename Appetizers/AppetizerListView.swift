//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizer?
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(isShowingDetail)
            }
            .task {
                viewModel.getAppetizersAsync()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: selectedAppetizer ?? MockData.appetizers[0],
                    isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.loading {
                LoadingSpinner()
            }
            
            
        }
        .alert(item: $viewModel.alert) {
            alert in Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton)
        }
        
        
    }
    
}


struct AppetizerCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
                
        }
    }
}


#Preview {
    AppetizerListView()
}
