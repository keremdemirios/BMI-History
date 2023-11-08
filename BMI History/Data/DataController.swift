//
//  DataController.swift
//  BMI History
//
//  Created by Kerem Demir on 8.11.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BmiModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved.")
        } catch {
            print("We could not save the data.")
        }
    }
    
    func addToHistories(result: Double, context: NSManagedObjectContext) {
        let bmiResult = BMIItems(context: context)
        bmiResult.id = UUID()
        bmiResult.date = Date()
        bmiResult.result = result
        
        save(context: context)
    }
    
    
}
