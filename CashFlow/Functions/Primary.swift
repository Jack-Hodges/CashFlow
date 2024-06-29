//
//  Primary.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import Foundation
import SwiftUI

func getAcronym(from: String) -> String {
    let words = from.split(separator: " ") // get all the words
    var result = ""
    for word in words {
        result += word.prefix(1).uppercased()
    }
    return result
}

func getTotals(from items: [Item]) -> String {
    var total: Double = 0
    for item in items {
        total += item.price
    }
    return roundTotal(from: total)
}

func roundTotal(from total: Double) -> String {
    if total.truncatingRemainder(dividingBy: 1) == 0 {
        return "$\(Int(total))"
    } else {
        return String(format: "$%.2f", total)
    }
}

func getCategoryColor(from name: String, user: User) -> Color {
    for category in user.category {
        if category.name == name {
            return Color(category.color)
        }
    }
    return Color.black
}
