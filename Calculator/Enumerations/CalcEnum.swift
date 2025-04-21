//
//  Operation.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import Foundation

enum Operation {
    case add
    case subtract
    case multiply
    case divide
    case equal
    case none
}


enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case percent = "%"
    case clear = "AC"
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    case equals = "="
    case negative = "IMGplus.forwardslash.minus"
    case undo = "IMGarrow.counterclockwise"
}

let enumOperators: [CalcButton] = [.add, .subtract, .multiply, .divide]

let multiplySymbol: String = CalcButton.multiply.rawValue
let divisionSymbol: String = CalcButton.divide.rawValue

let operators: String = "+-\(multiplySymbol)\(divisionSymbol)"
