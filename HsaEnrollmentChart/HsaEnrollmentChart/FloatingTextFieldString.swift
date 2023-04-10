//
//  FloatingTextFieldString.swift
//  HsaEnrollmentChart
//
//  Created by Jack Miller on 4/10/23.
//

import Foundation
import SwiftUI

struct FloatingTextFieldString: View {
    let title: String
    let text: Binding<String>
    let uiFontCaption = UIFont.systemFont(ofSize: 12)
    let uiFontRegular = UIFont.systemFont(ofSize: 17)

    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color(.placeholderText))
                .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                .font(.subheadline)
                
            TextField("", text: text) // give TextField an empty placeholder
        }
        .padding()
        .cornerRadius(20) /// make the background rounded
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1))
    }
}
