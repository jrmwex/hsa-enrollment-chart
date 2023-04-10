//
//  FloatingTextField.swift
//  HsaEnrollmentChart
//
//  Created by Jack Miller on 4/7/23.
//

import Foundation
import SwiftUI

struct FloatingTextField: View {
    let title: String
    let text: Binding<Float>

    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color(.placeholderText))
                .offset(y: text.wrappedValue.isSignalingNaN ? 0 : -25)
                .scaleEffect(text.wrappedValue.isSignalingNaN ? 1 : 0.8, anchor: .leading)
                .font(.subheadline)
                
            TextField("", value: text, formatter: getNumberFormatter()) // give TextField an empty placeholder
        }
        .padding()
        .cornerRadius(20) /// make the background rounded
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1))
    }
    
    func getNumberFormatter() -> NumberFormatter
    {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        return formatter
    }
}
