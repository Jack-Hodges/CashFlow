//
//  Sale.swift
//  CashFlow
//
//  Created by Jack Hodges on 29/6/2024.
//

import Foundation

class Sale: ObservableObject {
    @Published var id: String = UUID().uuidString
    @Published var items: [(Item, Int)] = []
    @Published var total: Double = 0.0
    
    func addItem(_ item: Item) {
        if let index = items.firstIndex(where: { $0.0.id == item.id }) {
            items[index].1 += 1
        } else {
            items.append((item, 1))
        }
        total += item.price
    }
}
