//
//  User.swift
//  CashFlow
//
//  Created by Jack Hodges on 28/6/2024.
//

import Foundation

struct User {
    var id: String
    var category: [Category]
}

var sampleUser = [
    User(id: UUID().uuidString, category: sampleCategories)
]
