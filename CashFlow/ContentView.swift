//
//  ContentView.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: User
    
    let items: [Item]
    @State var currCategory: Category
    @State var sale: Sale = Sale()
    
    @State private var showingAddItem = false
    
    init(user: User) {
        self.user = user
        self.items = sampleItems
        self._currCategory = State(initialValue: user.category[0])
    }
    
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("BackgroundColor"))
                .ignoresSafeArea()
            
            HStack {
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (user.category) { category in
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
                                .onTapGesture {
                                    showingAddItem = true
                                }
                        }
                        .padding(.leading)
                        .padding(.top, 20)
                    }
                    .scrollIndicators(.hidden)
                    
                    Spacer()
                    
                }
                .frame(width: UIScreen.main.bounds.width * 2/3 + 10)
                
                Spacer()
                Register(sale: sale, user: user)
                    .padding(.trailing, 20)
            }
            .sheet(isPresented: $showingAddItem, onDismiss: refreshCurrCategory) {
                AddItem(user: $user, category: $currCategory)
            }
        }
    }
    func refreshCurrCategory() {
        if let updatedCategory = user.category.first(where: { $0.id == currCategory.id }) {
            currCategory = updatedCategory
        }
    }
}

#Preview {
    ContentView(user: sampleUser[0])
}
