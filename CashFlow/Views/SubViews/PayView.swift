//
//  PayView.swift
//  CashFlow
//
//  Created by Jack Hodges on 9/7/2024.
//

import SwiftUI

struct PayView: View {
    @State private var selectedSurcharge: Int?
    @State private var selectedDiscount: Int?
    @State private var internalTotal: Double
    
    init(total: Double) {
        _internalTotal = State(initialValue: total)
        _selectedSurcharge = State(initialValue: 0)
        _selectedDiscount = State(initialValue: 0)
    }
    
    var body: some View {
        VStack {
            Text("Surcharges")
                .font(.system(size: 30, weight: .bold))
            HStack {
                createBox(value: 0, type: .surcharge, label: "No Surcharge")
                createBox(value: 5, type: .surcharge)
                createBox(value: 10, type: .surcharge)
                createBox(value: 15, type: .surcharge)
                createBox(value: nil, type: .surcharge, label: "Custom")
            }
            .padding(.bottom, 20)
            
            Text("Discounts")
                .font(.system(size: 30, weight: .bold))
            HStack {
                createBox(value: 0, type: .discount, label: "No Discount")
                createBox(value: 5, type: .discount)
                createBox(value: 10, type: .discount)
                createBox(value: 15, type: .discount)
                createBox(value: nil, type: .discount, label: "Custom")
            }
            .padding(.bottom, 20)
            
            Text("Total: \(String(format: "%.2f", calculatedTotal()))")
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 20)
        }
        .padding()
    }
    
    func createBox(value: Int?, type: BoxType, label: String? = nil) -> some View {
        Button(action: {
            switch type {
            case .surcharge:
                selectedSurcharge = value
            case .discount:
                selectedDiscount = value
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("LighterBackgroundColor"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: (isSelected(value: value, type: type) ? 3 : 0))
                    )
                
                if let number = value, number != 0 {
                    Text("\(number)%")
                        .font(.largeTitle)
                        .bold()
                } else if let label = label {
                    Text(label)
                        .font(.largeTitle)
                        .bold()
                }
            }
            .frame(width: 175, height: 100)
        }
    }
    
    func isSelected(value: Int?, type: BoxType) -> Bool {
        switch type {
        case .surcharge:
            return selectedSurcharge == value
        case .discount:
            return selectedDiscount == value
        }
    }
    
    func calculatedTotal() -> Double {
        var finalTotal = internalTotal
        
        if let surcharge = selectedSurcharge, surcharge != 0 {
            finalTotal += internalTotal * Double(surcharge) / 100.0
        }
        
        if let discount = selectedDiscount, discount != 0 {
            finalTotal -= internalTotal * Double(discount) / 100.0
        }
        
        return finalTotal
    }
    
    enum BoxType {
        case surcharge
        case discount
    }
}

#Preview {
    PayView(total: 50.5)
}
