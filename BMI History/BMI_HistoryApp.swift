//
//  BMI_HistoryApp.swift
//  BMI History
//
//  Created by Kerem Demir on 8.11.2023.
//

import SwiftUI

@main
struct BMI_HistoryApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
