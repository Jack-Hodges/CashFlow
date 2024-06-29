//
//  EditButton.swift
//  CashFlow
//
//  Created by Jack Hodges on 28/6/2024.
//

import SwiftUI

struct EditButton: View {
    
    var width: CGFloat
    var height: CGFloat
    var text: String
    var lightGray = Color(red: 0.929, green: 0.929, blue: 0.929) // #ededed
    var darkGray = Color(red: 0.322, green: 0.322, blue: 0.322) // #525252
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(darkGray)
            
            VStack {
                Spacer()
                
                Image(systemName: "plus")
                    .font(.system(size: 50, weight: .regular))
                    .foregroundStyle(.blue)
                
                Spacer()
                
                Text(text)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundStyle(.blue)
                
                Spacer()
            }
            .padding()
            
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    EditButton(width: 200, height: 150, text: "Add Category")
}
