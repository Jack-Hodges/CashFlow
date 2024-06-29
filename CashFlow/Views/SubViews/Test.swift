//
//  Test.swift
//  CashFlow
//
//  Created by Jack Hodges on 26/6/2024.
//

import SwiftUI

struct Test: View {
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                Image(systemName: "sun.min.fill")
                    .font(.system(size: 55))
                
                Text("29°C")
                    .font(.system(size: 22, weight: .bold))
                
                Text("Sydney")
            }
        }
    }
}

#Preview {
    Test()
}
