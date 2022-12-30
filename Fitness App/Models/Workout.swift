//
//  Exercise.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/29/22.
//

import Foundation

struct Workout {
    
    var workoutName : String
    var exercises : [Exercise]
}

struct Exercise {
    
    var exerciseName : String
    var numSets : Int
    var sets : [Set]
}

struct Set {
    
    var numReps : Int
    var weight : Double
}
