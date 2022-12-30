//
//  RectangleView.swift
//  Fitness App
//
//  Created by Dominic Danborn on 12/29/22.
//

import SwiftUI

struct RectangleView: View {
    
    var cardTitle : String
    
    var height : CGFloat
    
    var body: some View {
        
        ZStack (alignment: .topLeading){
            
            Rectangle()
                .frame(width: 380, height: height)
                .cornerRadius(10)
                .foregroundColor(Color(red: (217 / 255.0), green: (217 / 255.0), blue: (217 / 255.0)))
            
            Rectangle()
                .frame(width: 380, height: 35, alignment: .topLeading)
                .cornerRadius(10)
                .foregroundColor(Color(red: (187 / 255.0), green: (187 / 255.0), blue: (187 / 255.0)))
            
            Text(cardTitle)
                .padding(.leading, 15)
                .padding(.top, 9)
                
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        
    }
}
