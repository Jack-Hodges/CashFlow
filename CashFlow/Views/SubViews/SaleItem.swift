//
//  SaleItem.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct SaleItem: View {
    
    var item: Item
    var lightGray = Color(red: 0.929, green: 0.929, blue: 0.929) // #ededed
    var darkGray = Color(red: 0.322, green: 0.322, blue: 0.322) // #525252
    var lightBlue = Color(red: 0.455, green: 0.686, blue: 0.769) // #74afc4
    @State var user: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(darkGray)
            
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
                        .foregroundStyle(.white)
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
