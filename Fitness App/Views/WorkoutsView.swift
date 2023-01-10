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
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var exercisesForList : FetchedResults<ExerciseForList>
    
    @State private var showingAddWorkoutView: Bool = false
    
    @State private var showingAddExerciseView: Bool = false
    
    var body: some View {
        
        
            
        VStack {
            
            Section {
                
                ScrollView {
                    
                    ForEach(Array(workouts.enumerated()), id: \.element) { index, workout in
                        
                        NavigationLink(
                            destination: SingleWorkoutView(workout: workout),
                            label: {
                                RectangleView(cardTitle: workout.name!, height: 100)
                                    .padding(.vertical, -10)
                                    .foregroundColor(.black)
                            })
                        
                    }
                }
            } header: {
                
                ZStack {
                    
                    Rectangle()
                        .frame(width: 405, height: 50)
                        .foregroundColor(Color(red: (159 / 255.0), green: (159 / 255.0), blue: (159 / 255.0)))
                    
                    HStack {
                        
                        Text("Workouts")
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            // flips the value of showingAddView
                            showingAddWorkoutView.toggle()
                        } label: {
                            Label("Add workout", systemImage: "plus.circle")
                                .foregroundColor(.black)
                            
                        }
                        .sheet(isPresented: $showingAddWorkoutView) {
                            AddWorkoutView()
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                }
            }
            
            Section {
                
                ScrollView {
                    
                    ForEach(exercisesForList) { exercise in
                        
                        NavigationLink(
                            destination: SingleExerciseView(exercise: exercise),
                            label: {
                                RectangleExerciseView(cardTitle: exercise.name!, height: 30)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                            })
                    }
                }
            } header: {
                
                ZStack {
                    
                    Rectangle()
                        .frame(width: 405, height: 50)
                        .foregroundColor(Color(red: (159 / 255.0), green: (159 / 255.0), blue: (159 / 255.0)))
                    
                    HStack {
                        
                        Text("Exercises")
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            // flips the value of showingAddView
                            showingAddExerciseView.toggle()
                        } label: {
                            Label("Add exercise", systemImage: "plus.circle")
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $showingAddExerciseView) {
                            AddExerciseView()
                        }
                        
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                }
            }
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

struct AddWorkoutView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var length: Double = 0
    @State private var exerciseName: String = ""
    @State private var nSets: Double = 0.0
    @State private var exercises = [Exercise]()
    
    
    var body: some View {
        
        Form {
            
            Section {
                
                TextField("Workout name", text: $name)
                
                VStack {
                    Text("Length: \(DataController.calculateHours(seconds: Int(length))) hr \(DataController.calculateMins(seconds: Int(length))) mins")
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
            
            Section {
                
                TextField("Exercise", text: $exerciseName)
                
                VStack {
                    Text("Sets: \(Int(nSets))")
                    Slider(value: $nSets, in: 0...10, step: 1)
                }
                .padding()
                
            
            }
        }
    }
}

struct AddExerciseView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    
    @Environment (\.dismiss) var dismiss
    
    @State private var name: String = ""
    
    var body: some View {
        
        Form {
            
            Section {
                
                TextField("Workout name", text: $name)
                
                HStack {
                    
                    Spacer()
                    
                    Button("Submit") {
                        // add to the database
                        DataController().addExerciseToList(name: name, context: managedObjectContext)
                        
                        // dismiss the current view
                        dismiss()
                    }
                    
                    Spacer()
                }
            }
        }
        
    }
    
}

struct RectangleExerciseView: View {
    
    var cardTitle: String
    
    var height: CGFloat
    
    var body: some View {
        
        ZStack(alignment: .topLeading){
            
            Rectangle()
                .frame(width: 380, height: height)
                .cornerRadius(4)
                .foregroundColor(Color(red: (217 / 255.0), green: (217 / 255.0), blue: (217 / 255.0)))
            
            HStack {
                Spacer()
                Text(cardTitle)
                    .padding(.vertical, 4)
                Spacer()
            }
                
        }
    }
}
