//
//  WorkoutsView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/29/22.
//

import SwiftUI
import CoreData

struct WorkoutsView: View {
    
    // for data management
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // gets the data from CoreData
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var workouts : FetchedResults<Workout>
    
    @State private var showingAddView = false
    
    var body: some View {
        

        VStack {
            
            ScrollView {
                
                ForEach(workouts) { workout in
                    
                    ZStack(alignment: .leading) {
                        
                        RectangleView(cardTitle: workout.name!, height: 150)
                        
                        Text("\(DataController.calculateHours(seconds: Int(workout.lengthSeconds))) hr \(DataController.calculateMins(seconds: Int(workout.lengthSeconds))) mins")
                            .padding(.leading, 35)
                    }
                }
            }

        }.toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Workouts")
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // flips the value of showingAddView
                    showingAddView.toggle()
                } label: {
                    Label("Add workout", systemImage: "plus.circle")

                }

            }
            
        }
        .sheet(isPresented: $showingAddView) {
            AddWorkoutView()
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WorkoutsView()
    }
}
