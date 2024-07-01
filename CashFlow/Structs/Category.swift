//
//  Category.swift
//  CashFlow
//
//  Created by Jack Hodges on 28/6/2024.
//

import Foundation
import SwiftUI

struct Category: Identifiable, Equatable, Hashable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    var id: String = UUID().uuidString
    var name: String
    var color: Color
    var items: [Item]
}

var sampleCategories = [
    Category(name: "Hot Food", color: Color(red: 0.808, green: 0.561, blue: 1), items: sampleHotFood),
    Category(name: "Cold Food", color: Color.purple, items: sampleColdFood),
    Category(name: "Hot Drinks", color: Color.pink, items: sampleHotDrinks),
    Category(name: "Cold Drinks", color: Color.red, items: sampleColdDrinks),
    Category(name: "Snacks", color: Color.green, items: sampleSnacks)
]

var sampleHotFood = [
    Item(name: "Fries", price: 5, categoryName: "Hot Food"),
    Item(name: "Chicken Nuggets", price: 15, categoryName: "Hot Food"),
    Item(name: "Hawaiian Pizza", price: 12, categoryName: "Hot Food")
]

var sampleColdFood = [
    Item(name: "Ice Cream", price: 4, categoryName: "Cold Food"),
    Item(name: "Caramel Slice", price: 4.50, categoryName: "Cold Food"),
    Item(name: "Vanilla Slice", price: 4.5, categoryName: "Cold Food")
]

var sampleHotDrinks = [
    Item(name: "Coffee", price: 4, categoryName: "Hot Drinks"),
    Item(name: "Hot Chocolate", price: 4, categoryName: "Hot Drinks"),
    Item(name: "Cappuccino", price: 4.5, categoryName: "Hot Drinks")
]

var sampleColdDrinks = [
    Item(name: "Milkshake", price: 5, categoryName: "Cold Drinks"),
    Item(name: "Thickshake", price: 6, categoryName: "Cold Drinks"),
    Item(name: "Iced Coffee", price: 6.5, categoryName: "Cold Drinks")
]

var sampleSnacks = [
    Item(name: "Smiths Chips", price: 3, categoryName: "Snacks"),
    Item(name: "Red Rock Chips", price: 4, categoryName: "Snacks"),
    Item(name: "Chocolate Bar", price: 2, categoryName: "Snacks")
]
