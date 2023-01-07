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
    
    @State private var showingDeleteAlert = false
    
    var body: some View {
        

        VStack {
            
            ScrollView {
                
                ForEach(Array(workouts.enumerated()), id: \.element) { index, element in
                    
                    ZStack(alignment: .leading) {
                        
                        Button {
                            showingDeleteAlert = true
                        } label: {
                            RectangleView(cardTitle: element.name!, height: 150)
                        }
                        .alert("Delete this workout?", isPresented: $showingDeleteAlert) {
                            Button("OK") {
                                deleteWorkout(index: index)
                            }
                        }
                        
                        Text("\(DataController.calculateHours(seconds: Int(element.lengthSeconds))) hr \(DataController.calculateMins(seconds: Int(element.lengthSeconds))) mins")
                            .padding(.leading, 35)
                    }
                }
//                .onDelete(perform: deleteWorkout)
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
    
    private func deleteWorkout(index: Int) {
        
        let workoutToDelete = self.workouts[index]
        
        managedObjectContext.delete(workoutToDelete)
        
        try! managedObjectContext.save()
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WorkoutsView()
    }
}
