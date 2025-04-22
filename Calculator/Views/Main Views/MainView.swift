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
        GeometryReader { geometry in
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
                        geometry.size.width * 0.1 : 0)
                    
                    Spacer()
                    
                    CalculatorButtonsView(
                        mainResult: $mainResult,
                        currentComputation: $currentComputation,
                        width: geometry.size.width
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
}

#Preview {
    MainView()
}
