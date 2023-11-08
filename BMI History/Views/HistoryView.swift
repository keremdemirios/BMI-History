//
//  HistoryView.swift
//  BMI History
//
//  Created by Kerem Demir on 8.11.2023.
//

import SwiftUI

struct HistoryView: View {
    
    @FetchRequest(sortDescriptors: []) var bmi: FetchedResults<BMIItems>
    
    var body: some View {
        List(bmi) { bmi in
            VStack(alignment: .leading) {
                Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(.gray)
                HStack {
                    Text(String(format: "%.2f", bmi.result))
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("\(forScaleStatus(result:bmi.result))")
                        .font(.title2)
                        .foregroundColor(forScaleColor(result: bmi.result))
                }
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    HistoryView()
}
