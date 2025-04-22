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
                .foregroundColor(
                    isDarkMode
                    ? sunOrMoonNotSelectedColor
                    : sunOrMoonSelectedColor
                )
            Image(systemName: "moon")
                .foregroundColor(
                    isDarkMode
                    ? sunOrMoonSelectedColor
                    : sunOrMoonNotSelectedColor
                )
        }
        .imageScale(.large)
        .font(UIDevice.isIPad ? .title : .body)
        .fontWeight(UIDevice.isIPad ? .semibold : .regular)
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
