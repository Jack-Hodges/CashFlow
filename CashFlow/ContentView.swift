//
//  ContentView.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct ContentView: View {
    
    let user: User = sampleUser[0]
    
    let items: [Item] = sampleItems
    let categories: [Category] = sampleCategories
    @State var currCategory: Category = sampleCategories[0]
    @State var sale: Sale = Sale()
    
    static let color0 = Color(red: 0/255, green: 188/255, blue: 212/255);
    static let color1 = Color(red: 130/255, green: 145/255, blue: 238/255);
    
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]

    let gradient = Gradient(colors: [color0, color1]);
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
            
            HStack {
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (categories) { category in
                                CategoryView(category: category)
                                    .onTapGesture {
                                        currCategory = category
                                    }
                            }
                            EditButton(width: 200, height: 150, text: "Add Category")
                        }
                    }
                    .padding(.leading)
                    
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(currCategory.items) { item in
                                SaleItem(item: item, user: user)
                                    .onTapGesture {
                                        sale.addItem(item)
                                    }
                            }
                            EditButton(width: 220, height: 175, text: "Add Item")
                        }
                        .padding(.leading)
                        .padding(.top, 20)
                    }
                    .scrollIndicators(.hidden)
                    
                    Spacer()
                    
                }
                .frame(width: UIScreen.main.bounds.width * 2/3 + 10)
                
                Spacer()
                Register(sale: sale)
                    .padding(.trailing, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
