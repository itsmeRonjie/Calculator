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
                            print("btn tapped")
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
}

#Preview {
    CalculatorButtonsView(
        mainResult: .constant("5+1"),
        currentComputation: .constant("6")
    )
}
