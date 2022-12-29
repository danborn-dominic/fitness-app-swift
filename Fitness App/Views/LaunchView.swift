//
//  LaunchView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/28/22.
//

import SwiftUI

struct LaunchView: View {
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                HomeView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            
            NavigationView {
                WorkoutsView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "figure.strengthtraining.traditional")
                    Text("Workouts")
                }
            }
            
            NavigationView {
                RecentView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "clock")
                    Text("Recent")
                }
            }
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "ellipsis")
                    Text("More")
                }
            }
            
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        LaunchView()
    }
    
}
