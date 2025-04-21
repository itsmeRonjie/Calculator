//
//  StringHelper.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import Foundation

func getLastChar(_ input: String) -> String {
    guard !input.isEmpty else {
        return ""
    }
    return String(input.last!)
}

func lastCharIsEqualTo(_ input: String, _ char: String) -> Bool {
    getLastChar(input) == char
}

func formatResult(_ result: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    return numberFormatter.string(from: NSNumber(value: result)) ?? "0"
}

func lastCharIsDigitOrPercent(_ input: String) -> Bool {
    ("0123456789%").contains(getLastChar(input))
}

func lastCharIsDigit(_ input: String) -> Bool {
    ("0"..."9").contains(getLastChar(input))
}
