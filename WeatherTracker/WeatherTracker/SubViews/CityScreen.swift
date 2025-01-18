//
//  CityScreen.swift
//  WeatherTracker
//
//  Created by Dylan Nienberg on 1/18/25.
//

import SwiftUI

struct CityScreen: View {
    @Binding var refreshView: Bool
    @Binding var city: String
    let weather: Weather
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(city)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("\(Int(weather.current.temp_f)) °")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(Edge.Set.leading, 10)
                Spacer()
                AsyncImage(url: URL(string: "https:\(weather.current.condition.icon)")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140, height: 80)
                    case .failure:
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            Spacer()
        }
        .padding()
        .onTapGesture {
            saveCityName(cityName: city)
            city = ""
            refreshView.toggle()
        }
    }
}
