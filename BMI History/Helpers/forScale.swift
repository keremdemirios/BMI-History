//
//  forScale.swift
//  BMI History
//
//  Created by Kerem Demir on 8.11.2023.
//

import Foundation
import SwiftUI

public func forScaleColor(result: Double) -> Color {
    switch result {
    case 0..<18.4:
        return .blue
    case 18.5..<24.9:
        return .green
    case 24.5..<39.9:
        return .orange
    default:
        return .red
    }
}

public func forScaleStatus(result: Double) -> String {
    switch result {
    case 0..<18.4:
        return "Underweight"
    case 18.5..<24.9:
        return "Normal"
    case 24.5..<39.9:
        return "Overweight"
    default:
        return "Obese"
    }
}
