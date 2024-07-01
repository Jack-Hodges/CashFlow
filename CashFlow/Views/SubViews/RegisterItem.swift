//
//  RegisterItem.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct RegisterItem: View {
    var item: Item
    var itemCount: Int
    var sale: Sale
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.system(size: 25, weight: .bold))
                Text("\(roundTotal(from: item.price)) x \(itemCount)")
                    .font(.system(size: 20, weight: .light))
            }
            .foregroundStyle(.primary)
            
            Spacer()
            
            Image(systemName: "trash")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.red)
                .onTapGesture {
                    // subtract the value of the items we are removing and remove them
                    sale.removeItem(item)
                }
        }
        .padding()
        .frame(width: 380)
        .background(
            Color("BackgroundColor")
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
    }
}

#Preview {
    RegisterItem(item: sampleItems[0], itemCount: 1, sale: Sale())
}
