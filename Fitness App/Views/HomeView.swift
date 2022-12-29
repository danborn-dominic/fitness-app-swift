//
//  HomeView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/29/22.
//

import SwiftUI

struct HomeView: View {
    
    var color : UIColor = UIColor(red: 187, green: 187, blue: 187, alpha: 1)
    
    var body: some View {
        
        ZStack {
            Color(UIColor(red: (242 / 255.0), green: (242 / 255.0), blue: (242 / 255.0), alpha: 1.0))
                .ignoresSafeArea()
            Text("Home View")
        }
        .toolbar {
            
            ToolbarItem(placement: .principal) {
                
                Text("Today")
                    .bold()
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
