//
//  SettingsView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/29/22.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        Text("Settings View")
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    
                    Text("More")
                        .bold()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
