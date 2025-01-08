//
//  AddButton.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//

import SwiftUI

struct AddButton: View {
    @Binding var isAdding: Bool
    var body: some View {
        Button(action: {isAdding.toggle()}) {
            Image(systemName: "plus.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.blue)
        }
    }
}
