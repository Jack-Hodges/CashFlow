//
//  SaleItem.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct SaleItem: View {
    
    var item: Item
    @State var user: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("LighterBackgroundColor"))
            
            VStack {
                HStack {
                    Text(item.name)
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundStyle(getCategoryColor(from: item.categoryName, user: user))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Text(roundTotal(from: item.price))
                        .font(.system(size: 25))
                        .foregroundStyle(.primary)
                    Spacer()
                }
            }
            .padding()
        }
        .frame(width: 220, height: 175)
    }
}

#Preview {
    SaleItem(item: sampleItems[0], user: sampleUser[0])
}
