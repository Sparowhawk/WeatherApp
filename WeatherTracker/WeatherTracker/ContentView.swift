//  ContentView.swift
//  WeatherTracker
//
//  Created by Dylan Nienberg on 1/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var city = ""
    @State private var weather: Weather?
    @State private var refreshView = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(city: $city, weather: $weather) {
                    saveCityName(cityName: city)
                    FetchWeather().getCurrentWeather(city: city) { weather in
                        self.weather = weather
                    }
                }
                
                Spacer()
                
                if let weather = weather {
                    if city.isEmpty {
                        HomeScreen(weather: weather)
                    } else {
                        CityScreen(refreshView: $refreshView, city: $city, weather: weather)
                    }
                } else if city.isEmpty {
                    NoCitySelectedView()
                } else {
                    EmptyView()
                }
            }
        }
        .onAppear {
            fetch()
        }
        .id(refreshView)
    }
    
    private func fetch() {
        FetchWeather().getCurrentWeather(city: retrieveSavedCity()) { weather in
            self.weather = weather
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
