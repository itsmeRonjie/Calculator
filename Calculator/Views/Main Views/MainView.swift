//
//  ContentView.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import SwiftUI

struct MainView: View {
    @State var isDarkMode = false
    @State var currentComputation = ""
    @State var mainResult = "0"
    var body: some View {
        ZStack {
            primaryBackgroundColor.ignoresSafeArea()
            

            VStack {
                SunMoonView(isDarkMode: isDarkMode)
                    .onTapGesture {
                        withAnimation {
                            isDarkMode.toggle()
                        }
                    }
                
                Spacer()
                
                ComputationView(
                    mainResult: mainResult,
                    currentComputation: currentComputation
                )
                Spacer()
                
                CalculatorButtonsView(
                    mainResult: $mainResult,
                    currentComputation: $currentComputation
                )
            }
            .padding()
        }
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

#Preview {
    MainView()
}
