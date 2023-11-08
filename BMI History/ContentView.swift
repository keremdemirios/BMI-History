//
//  ContentView.swift
//  BMI History
//
//  Created by Kerem Demir on 8.11.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var index = 0
    @State private var weight = 55.0
    @State private var height = 150.0
    
    @Environment(\.managedObjectContext) var managedObjCOntext
    @FetchRequest(sortDescriptors: []) var bmi: FetchedResults<BMIItems>
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Which one of you want see ?", selection: $index) {
                    Text("Calculator").tag(0)
                    Text("History").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(10)
                
                if index == 0 {
                    CalculatorView(weight: $weight, height: $height)
                } else {
                    HistoryView()
                }
            }.navigationTitle("Body Mass Index")
        }
    }
}

#Preview {
    ContentView()
}
