//
//  CategoryView.swift
//  CashFlow
//
//  Created by Jack Hodges on 28/6/2024.
//

import SwiftUI

struct CategoryView: View {
    
    var category: Category
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(category.color)
            
            VStack {
                Image(category.name)
                    .resizable()
                    .frame(width: 75, height: 75)
                Spacer()
                Text(category.name)
                    .font(.title)
                    .foregroundStyle(.white)
                    .bold()
            }
            .padding()
            
        }
        .frame(width: 200, height: 150)
    }
}

#Preview {
    CategoryView(category: sampleCategories[0])
}
