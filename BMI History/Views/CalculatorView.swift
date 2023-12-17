//
//  CalculatorView.swift
//  BMI History
//
//  Created by Kerem Demir on 8.11.2023.
//

import SwiftUI

struct CalculatorView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @Binding var weight: Double
    @Binding var height: Double
    
    var body: some View {
        VStack {
            HStack{
                Text("Weight (Kg)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text(String(format:"%.0f", weight))
                    .font(.title)
                    .bold()
            }
            .padding(.top, 15)
            Slider(value: $weight, in: 30...150)
            
            HStack{
                Text("Height (cm)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text(String(format:"%.0f", height))
                    .font(.title)
                    .bold()
            }
            .padding(.top, 25)
            Slider(value: $height, in: 130...230)
            
            HStack{
                Text("Your Body Mass Index")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                VStack(alignment: .trailing){
                    Text(String(format: "%.2f", calculateBmi()))
                        .font(.title)
                        .bold()
                    Text(bmiScale())
                        .font(.body)
                        .foregroundColor(bmiScaleColor())
                }
            }
            .padding(.top, 40)
            
            Button {
                DataController().addToHistories(result: calculateBmi(), context: managedObjContext)
            } label: {
                Text("Saved to History")
                    .frame(maxWidth: 200, maxHeight: 40)
            }
            .background(.blue)
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .cornerRadius(12.0)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
    
    func calculateBmi() -> Double {
        return weight * 10000 / (height * height)
    }
    
    public func bmiScale() -> String {
        switch calculateBmi() {
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
    
    public func bmiScaleColor() -> Color {
        switch calculateBmi() {
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
}

#Preview {
    CalculatorView(weight: .constant(24.5), height: .constant(175.0))
}
