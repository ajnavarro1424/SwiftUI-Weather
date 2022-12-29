//
//  WeatherButtonView.swift
//  SwiftUI-Weather
//
//  Created by Alex Navarro on 12/29/22.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        Button {
            print("tapped")
        } label: {
            Text(buttonText)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
    }
}
