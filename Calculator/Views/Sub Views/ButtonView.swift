//
//  ButtonView.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import SwiftUI

struct ButtonView: View {
    let calcButton: CalcButton
    let fgColor: Color
    let bgColor: Color
    let width: CGFloat
    
    var systemImage: String? {
        let value = calcButton.rawValue
        return if value.contains("IMG") {
            value.replacingOccurrences(
                of: "IMG",
                with: ""
            )
        } else {
            nil
        }
    }
    var text: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? nil : value
    }
    
    var buttonDim: CGFloat {
        UIDevice.isIPad ? width / 6 : width / 5
    }
    
    var body: some View {
        ZStack {
            if let text = text {
                Text(text)
            }
            if let systemImage = systemImage {
                Image(systemName: systemImage)
            }
        }
        .font(UIDevice.isIPad ? .largeTitle : .title2)
        .fontWeight(UIDevice.isIPad ? .heavy : .semibold)
        .frame(width: buttonDim, height: buttonDim)
        .foregroundStyle(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: bgColor.opacity(0.5), radius: 3, x: 5, y: 5)
    }
}

#Preview {
    GeometryReader { geometry in
        VStack {
            ButtonView(
                calcButton: .one,
                fgColor: foregroundDigitsColor,
                bgColor: buttonBackgroundColor,
                width: geometry.size.width
            )
            ButtonView(
                calcButton: .clear,
                fgColor: foregroundTopButtonsColor,
                bgColor: buttonBackgroundColor,
                width: geometry.size.width
            )
            ButtonView(
                calcButton: .negative,
                fgColor: foregroundRightButtonsColor,
                bgColor: buttonBackgroundColor,
                width: geometry.size.width
            )
        }
    }
}
