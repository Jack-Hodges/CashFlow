//
//  Item.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import Foundation

struct Item: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var price: Double
    var categoryName: String
    var acronym: String {
        return getAcronym(from: name)
    }
}

// Sample Data
let sampleItems = [
    Item(name: "Fries", price: 5, categoryName: "Hot Food"),
    Item(name: "Chicken Nuggets", price: 15, categoryName: "Hot Food"),
    Item(name: "Hawaiian Pizza", price: 12, categoryName: "Hot Food"),
    Item(name: "Hawaiian Pizza", price: 12, categoryName: "Hot Food"),
    Item(name: "Fries", price: 5, categoryName: "Hot Food")
]
