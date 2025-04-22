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
                    currentComputation: currentComputation,
                    mainResult: mainResult
                )
                .padding(
                    .horizontal,
                    UIDevice.isIPad ?
                    UIScreen.main.bounds.width * 0.1 : 0)
                
                Spacer()
                
                CalculatorButtonsView(
                    mainResult: $mainResult,
                    currentComputation: $currentComputation
                )
                
                if UIDevice.isIPad {
                    Spacer()
                }
            }
            .padding()
        }
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

#Preview {
    MainView()
}
