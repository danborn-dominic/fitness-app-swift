//
//  WorkoutsView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/29/22.
//

import SwiftUI

struct WorkoutsView: View {
    
    var body: some View {
        
        Text("Workouts View")
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    
                    Text("Workouts")
                        .bold()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}
