//
//  ComputationView.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import SwiftUI

struct ComputationView: View {
    let mainResult: String
    let currentComputation: String
    var body: some View {
        VStack {
            Text(mainResult)
            Text(currentComputation)
        }
    }
}

#Preview {
    ComputationView(mainResult: "", currentComputation: "0")
}
