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
    
    let buttonData: [RowOfCalcButtonModel] = [
        RowOfCalcButtonModel(
            row: [
                CalcButtonModel(
                    calcButton: .clear,
                    color: foregroundTopButtonsColor
                ),
                CalcButtonModel(
                    calcButton: .negative,
                    color: foregroundTopButtonsColor
                ),
                CalcButtonModel(
                    calcButton: .percent,
                    color: foregroundTopButtonsColor
                ),
                CalcButtonModel(
                    calcButton: .divide,
                    color: foregroundRightButtonsColor
                )
            ]
        ),
        RowOfCalcButtonModel(
            row: [
                CalcButtonModel(calcButton: .seven),
                CalcButtonModel(calcButton: .eight),
                CalcButtonModel(calcButton: .nine),
                CalcButtonModel(
                    calcButton: .multiply,
                    color: foregroundRightButtonsColor
                )
            ]
        ),
        RowOfCalcButtonModel(
            row: [
                CalcButtonModel(calcButton: .four),
                CalcButtonModel(calcButton: .five),
                CalcButtonModel(calcButton: .six),
                CalcButtonModel(
                    calcButton: .subtract,
                    color: foregroundRightButtonsColor
                )
            ]
        ),
        RowOfCalcButtonModel(
            row: [
                CalcButtonModel(calcButton: .one),
                CalcButtonModel(calcButton: .two),
                CalcButtonModel(calcButton: .three),
                CalcButtonModel(
                    calcButton: .add,
                    color: foregroundRightButtonsColor
                )
            ]
        ),
        RowOfCalcButtonModel(
            row: [
                CalcButtonModel(calcButton: .undo),
                CalcButtonModel(calcButton: .zero),
                CalcButtonModel(calcButton: .decimal),
                CalcButtonModel(
                    calcButton: .equals,
                    color: foregroundRightButtonsColor
                )
            ]
        )
    ]
    
    var body: some View {
        Grid() {
            ForEach(buttonData) { rowOfCalcButtonModel in
                GridRow {
                    ForEach(rowOfCalcButtonModel.row) { calcButtonModel in
                        Button {
                            buttonPressed(
                                calcButton: calcButtonModel.calcButton
                            )
                        } label: {
                            ButtonView(
                                calcButton: calcButtonModel.calcButton,
                                fgColor: calcButtonModel.color,
                                bgColor: buttonBackgroundColor
                            )
                        }
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(20))
    }
    
    func buttonPressed(calcButton: CalcButton) {
        switch calcButton {
        case .equals, .negative:
            if !currentComputation.isEmpty{
                if !lastCharIsAnOperator(currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    mainResult = formatResult(sign*calculateResults())
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
            
        case .decimal:
            if let lastOccurenceOfDecimal = currentComputation.lastIndex(of: ".") {
                if lastCharIsDigit(currentComputation) {
                    let startIndex = currentComputation.index(after: lastOccurenceOfDecimal)
                    let endIndex = currentComputation.endIndex
                    let range = startIndex..<endIndex
                    
                    let rightSubstring = String(currentComputation[range])
                    
                    if Int(rightSubstring) == nil && !rightSubstring.isEmpty {
                        currentComputation += "."
                    }
                }
            } else {
                if currentComputation.isEmpty {
                    currentComputation += "0."
                } else if lastCharIsDigit(currentComputation) {
                    currentComputation += "."
                }
            }
            
            
        case .percent:
            if lastCharIsDigit(currentComputation) {
                appendToCurrentComputation(calcButton)
            }
            
        case .undo:
            currentComputation = String(currentComputation.dropLast())
            
        case .add, .subtract, .multiply, .divide:
            if lastCharIsDigitOrPercent(currentComputation) {
                appendToCurrentComputation(calcButton)
            }

        case .clear:
            currentComputation = ""
            mainResult = "0"

        default:
            appendToCurrentComputation(calcButton)
        }
    }
    
    func appendToCurrentComputation(_ calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
    
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
        workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
        workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")
        
        if getLastChar(visibleWorkings) == "." {
            workings += "0"
        }
        
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        
        return exprValue
    }
}

#Preview {
    CalculatorButtonsView(
        mainResult: .constant("5+1"),
        currentComputation: .constant("6")
    )
}
