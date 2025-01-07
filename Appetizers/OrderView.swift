//
//  OrderView.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) {
                            appetizer in AppetizerCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in order.items.remove(atOffsets: indexSet) })
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") Place Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 260, height: 50)
                            .foregroundColor(.white)
                            .background(Color(.brandPrimary))
                            .cornerRadius(10)
                    }
                }
                
                if order.items.isEmpty {
                    EmptyStateView()
                }
                
            }
            .navigationTitle("Orders")
        }
        
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
