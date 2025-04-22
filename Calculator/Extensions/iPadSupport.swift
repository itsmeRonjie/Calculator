//
//  iPadSupport.swift
//  Calculator
//
//  Created by Ronjie Diafante Man-on on 4/21/25.
//

import Foundation
import SwiftUI

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
