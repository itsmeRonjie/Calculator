//
//  CalculatorButtonsView.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import SwiftUI

struct CalculatorButtonsView: View {
    @Binding var mainResult: String
    @Binding var currentComputation: String
    var body: some View {
        Text(mainResult)
        Text(currentComputation)
    }
}

#Preview {
    CalculatorButtonsView(
        mainResult: .constant("5+1"),
        currentComputation: .constant("6")
    )
}
