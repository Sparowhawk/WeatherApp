//
//  SearchBar.swift
//  WeatherTracker
//
//  Created by Dylan Nienberg on 1/18/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var city: String
    @Binding var weather: Weather?
    
    let onCommit: () -> Void
    
    var body: some View {
        HStack {
            Spacer(minLength: 20)
            HStack {
                TextField("Search Location", text: $city, onCommit: onCommit).onChange(of: city) {
                    self.weather = nil
                }
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.gray.opacity(0.15))
            .cornerRadius(15)
            Spacer(minLength: 20)
        }
    }
}
