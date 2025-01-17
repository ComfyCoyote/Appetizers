//
//  Order.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/29/24.
//

import SwiftUI


final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double{
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    
}
