//
//  Appetizer.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import Foundation


struct Appetizer: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockData {
    
    static let sampleAppetizer = Appetizer(
        id: 001,
        name: "Test Appetizer",
        description: "Test Appetizer Description",
        price: 10.00,
        imageURL: "",
        calories: 100,
        protein: 10,
        carbs: 10
    )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    
    static let orderItemOne = Appetizer(
        id: 001,
        name: "Test Appetizer One",
        description: "Test Appetizer Description",
        price: 10.00,
        imageURL: "",
        calories: 100,
        protein: 10,
        carbs: 10
    )
    
    static let orderItemTwo = Appetizer(
        id: 002,
        name: "Test Appetizer Two",
        description: "Test Appetizer Description",
        price: 10.00,
        imageURL: "",
        calories: 100,
        protein: 10,
        carbs: 10
    )
    
    static let orderItemThree = Appetizer(
        id: 003,
        name: "Test Appetizer Three",
        description: "Test Appetizer Description",
        price: 10.00,
        imageURL: "",
        calories: 100,
        protein: 10,
        carbs: 10
    )
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
