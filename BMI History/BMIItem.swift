//
//  BMIItems.swift
//  BMI History
//
//  Created by Kerem Demir on 8.11.2023.
//

import Foundation
import SwiftUI

struct BMIItem {
    let id = UUID()
    let date : Date?
    let result : Double
    
    var BMIResult : BMIType {
        switch result {
        case 0..<18.4:
            return BMIResults.underweight
        case 18.4..<24.9:
            return BMIResults.normal
        case 24.9..<39.9:
            return BMIResults.overweight
        default:
            return BMIResults.obese
        }
    }
}

protocol BMIType {
    var color : Color {get}
    var title : String {get}
}

enum BMIResults {
    case underweight
    case normal
    case overweight
    case obese
}

extension BMIResults : BMIType {
    var color: Color {
        switch self {
        case .normal:
            return .green
        case .underweight:
            return .blue
        case .overweight:
            return .orange
        case .obese:
            return .red
        }
    }
    
    var title: String {
        switch self {
        case .normal: "Normal"
        case .obese: "Obese"
        case .overweight: "Overweight"
        case .underweight: "Underweight"
        }
    }
}
