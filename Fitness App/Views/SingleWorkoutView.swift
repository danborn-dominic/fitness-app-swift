//
//  SingleWorkoutView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/7/23.
//

import SwiftUI
import CoreData

struct SingleWorkoutView: View {
    
    @State var workout: Workout
    
    @State var showingDeleteAlert = false
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                
                
            }
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Text("\(workout.name!)")
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingDeleteAlert = true
                } label: {
                    Label("Add workout", systemImage: "plus.circle")
                }
                .alert("Delete this workout?", isPresented: $showingDeleteAlert) {
                    
                }


            }
            
        }
    }
}
