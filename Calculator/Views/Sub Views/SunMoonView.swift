//
//  SunMoonView.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import SwiftUI

struct SunMoonView: View {
    var isDarkMode: Bool
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sun.min")
                .imageScale(.large)
                .foregroundColor(
                    isDarkMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor
                )
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundColor(
                    isDarkMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor
                )
        }
        .padding()
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    VStack {
        SunMoonView(isDarkMode: true)
        SunMoonView(isDarkMode: false)
    }
}
