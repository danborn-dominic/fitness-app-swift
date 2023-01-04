//
//  Fitness_App.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/28/22.
//

import SwiftUI

@main
struct Fitness_App: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        
        WindowGroup {
            
            // entry point of the app. injects the data controller for use
            LaunchView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
