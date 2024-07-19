//
//  AddItem.swift
//  CashFlow
//
//  Created by Jack Hodges on 19/7/2024.
//

import SwiftUI

struct AddItem: View {
    
    @Binding var user: User
    @Binding var category: Category
    @State private var itemName: String = ""
    @State private var itemPrice: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Add Item to \(category.name)")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            TextField("Item Name", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            TextField("Item Price", text: $itemPrice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding(.bottom, 20)
            
            Button(action: {
                addItem()
            }) {
                Text("Add Item")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .disabled(itemName.isEmpty || itemPrice.isEmpty)
            
            Spacer()
        }
        .padding()
    }
    
    func addItem() {
        guard let price = Double(itemPrice) else {
            // Handle invalid price input
            return
        }
        let newItem = Item(name: itemName, price: price, categoryName: category.name)
        print(newItem)
        if let index = user.category.firstIndex(where: { $0.id == category.id }) {
            user.category[index].items.append(newItem)
            print("Category found")
            print(user.category[index])
        } else {
            print("Category not found")
        }
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    @State var sampleCategory = Category(name: "Hot Food", color: Color.blue, items: sampleItems)
    @State var sampleUser = sampleUser[0]
    return AddItem(user: $sampleUser, category: $sampleCategory)
}
