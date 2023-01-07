//
//  DataController.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/3/23.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    
    // need the persistance container, how you interact with the data
    let container = NSPersistentContainer(name: "WorkoutModel")
    
    // constructor
    init() {
        // loads the data
        container.loadPersistentStores { description, error in
            
            if let error = error {
                // failed, print description
                print("Failed to load the data. Error: \(error.localizedDescription)")
            }
        }
    }
    
    // function to save the data
    func save(context: NSManagedObjectContext) {
        
        do {
            try context.save()
            print("Data saved! Success!")
        }
        catch {
            print("Unable to save the data.")
        }
    }
    
    // function to add a workout to the given context
    func addWorkout(name: String, length: Int64, context: NSManagedObjectContext) {
        // create a new workout object
        let workout = Workout(context: context)
        workout.id = UUID()
        workout.date = Date()
        workout.name = name
        workout.lengthSeconds = length
        
        // call the save function, just calls the context save method
        save(context: context)
    }
    
    func editWorkout(workout: Workout, name: String, length: Int64, context: NSManagedObjectContext) {
        let workout = Workout(context: context)
        workout.name = name
        workout.lengthSeconds = length
        
        save(context: context)
    }
    
    
    
    static func calculateMins(seconds: Int) -> Int {
        return Int(Int((Double(seconds) / 60.0)) % 60)
    }
    
    static func calculateHours(seconds: Int) -> Int {
        return Int(Double(seconds) / 3600.0)
    }
}
