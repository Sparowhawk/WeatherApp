//
//  NoCitySelectedView.swift
//  WeatherTracker
//
//  Created by Dylan Nienberg on 1/18/25.
//

import SwiftUI

struct NoCitySelectedView: View {
    var body: some View {
        Text("No City Selected")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.vertical, 10)
        
        Text("Please Search For A City")
            .font(.body)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
        Spacer()
        
    }
    
}
