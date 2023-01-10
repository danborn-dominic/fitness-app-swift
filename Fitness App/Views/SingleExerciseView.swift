//
//  SingleExerciseView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 1/10/23.
//

import SwiftUI
import CoreData

struct SingleExerciseView: View {
    
    @State var exercise: ExerciseForList
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
            }
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Text("\(exercise.name!)")
                    .bold()
            }
        }
    }
}

//struct SingleExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleExerciseView()
//    }
//}
