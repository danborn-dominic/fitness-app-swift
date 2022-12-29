//
//  RecentView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/29/22.
//

import SwiftUI

struct RecentView: View {
    
    var body: some View {
        
        Text("Recent View")
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    
                    Text("Recent")
                        .bold()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
