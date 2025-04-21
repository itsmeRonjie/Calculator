//
//  CalcButtonModel.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import Foundation
import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigitsColor
    
}
