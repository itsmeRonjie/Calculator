//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            if UIDevice.isIPad{
                Text("iPad")
            } else {
                MainView()
            }
        }
    }
}
