//
//  AddWorkoutView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/3/23.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var length : Double = 0
    
    var body: some View {
        
        Form {
            
            Section {
                
                TextField("Workout name", text: $name)
                
                VStack {
                    Text("\(DataController.calculateHours(seconds: Int(length))) hr \(DataController.calculateMins(seconds: Int(length))) mins")
                    Slider(value: $length, in: 0...10800, step: 60)
                }
                .padding()
                
                HStack {
                    Spacer()
                    
                    Button("Submit") {
                        // add to the database
                        DataController().addWorkout(name: name, length: Int64(length), context: managedObjectContext)
                        // dismiss the current view
                        dismiss()
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView()
    }
}
