//
//  Register.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct Register: View {
    
    @ObservedObject var sale: Sale
    @State var user: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("LighterBackgroundColor"))
            VStack {
                HStack {
                    Text("Items (\(sale.getItemCount()))")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.primary)
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    ForEach(groupedItems, id: \.key) { category, items in
                        VStack(alignment: .leading) {
                            Text(category)
                                .font(.system(size: 30, weight: .bold))
                                .foregroundStyle(getCategoryColor(from: category, user: user))
                                .padding(.bottom, -5)
                                .padding(.top, -5)
                            
                            ForEach(items, id: \.0.id) { (item, itemCount) in
                                RegisterItem(item: item, itemCount: itemCount, sale: sale)
                            }
                        }
                        .padding(.bottom)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Payment Summary")
                        .font(.system(size: 40, weight: .bold))
                    
                    // surcharges
                    HStack {
                        Text("Surcharge")
                        Spacer()
                        Text("0%")
                    }
                    .font(.system(size: 20, weight: .medium))
                    
                    // discounts
                    HStack {
                        Text("Discount")
                        Spacer()
                        Text("0%")
                    }
                    .font(.system(size: 20, weight: .medium))
                    
                    
                    // total price
                    HStack {
                        Text("Price")
                        Spacer()
                        Text("\(roundTotal(from: sale.total))")
                    }
                    .font(.system(size: 30, weight: .medium))
                    
                }
                .foregroundStyle(.primary)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundStyle(Color("BackgroundColor"))
                    
                    HStack {
                        Image(systemName: "creditcard.fill")
                        Text("Pay")
                        Spacer()
                    }
                    .font(.system(size: 25, weight: .bold))
                    .padding()
                    .foregroundStyle(.primary)
                }
                .frame(width: 370, height: 60)
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width * 1/3 - 50)
    }
    
    // create a dictionary that groups all items by their category name, so we can categorise them in register view
    private var groupedItems: [(key: String, value: [(Item, Int)])] {
        Dictionary(grouping: sale.items, by: { $0.0.categoryName })
            .sorted(by: { $0.key < $1.key })
    }
}

#Preview {
    Register(sale: Sale(), user: sampleUser[0])
}
