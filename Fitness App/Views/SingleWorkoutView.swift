//
//  SingleWorkoutView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/7/23.
//

import SwiftUI
import CoreData

struct SingleWorkoutView: View {
    
    // for data management
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var workout: Workout
    
    @State private var showingDeleteAlert = false
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
            }
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Workouts")
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingDeleteAlert = true
                } label: {
                    Image(systemName: "more")
                }
                .alert("Delete this workout?", isPresented: $showingDeleteAlert) {
                    Button("OK") {
                        deleteWorkout(index: index)
                    }
                }


            }
            
        }
    }
}
