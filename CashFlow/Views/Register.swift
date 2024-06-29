//
//  Register.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct Register: View {
    
    @ObservedObject var sale: Sale
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("LighterBackgroundColor"))
            VStack {
                HStack {
                    Text("Items (\(sale.items.count))")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.primary)
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    ForEach(sale.items, id: \.0.id) { (item, itemCount) in
                        RegisterItem(item: item, itemCount: itemCount, sale: sale)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Payment Summary")
                        .font(.system(size: 40, weight: .bold))
                    HStack {
                        Text("Price")
                        Spacer()
                        Text("\(roundTotal(from: sale.total))")
                    }
                    .font(.system(size: 30, weight: .medium))
                }
                .foregroundStyle(.primary)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundStyle(Color("BackgroundColor"))
                            
                        HStack {
                            Image(systemName: "creditcard.fill")
                            Spacer()
                            Text("Card")
                        }
                        .font(.system(size: 25, weight: .bold))
                        .padding()
                        .foregroundStyle(.primary)
                    }
                    .frame(width: 180, height: 60)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundStyle(Color("BackgroundColor"))
                            
                        HStack {
                            Image(systemName: "creditcard.fill")
                            Spacer()
                            Text("Cash")
                        }
                        .font(.system(size: 25, weight: .bold))
                        .padding()
                        .foregroundStyle(.primary)
                    }
                    .frame(width: 180, height: 60)
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width * 1/3 - 50)
    }
}

#Preview {
    Register(sale: Sale())
}
