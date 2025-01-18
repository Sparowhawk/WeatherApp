//
//  HomeScreen.swift
//  WeatherTracker
//
//  Created by Dylan Nienberg on 1/18/25.
//

import SwiftUI

struct HomeScreen: View {
    let weather: Weather
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https:\(weather.current.condition.icon)")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            HStack {
                Text("\(weather.location.name) ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Image("Vector")
            }
            
            Text("\(Int(weather.current.temp_f)) °")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            HStack {
                Spacer(minLength: 30)
                HStack {
                    VStack {
                        Text("Humidity")
                            .foregroundColor(.gray)
                        Text("\(weather.current.humidity)%")
                    }
                    .padding(Edge.Set.leading, 10)
                    Spacer()
                    VStack {
                        Text("UV")
                            .foregroundColor(.gray)
                        Text("\((Int(weather.current.uv)))")
                    }
                    Spacer()
                    VStack {
                        Text("Feels Like")
                            .foregroundColor(.gray)
                        Text("\((Int(weather.current.feelslike_f)))")
                    }
                    .padding(Edge.Set.trailing, 10)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                Spacer(minLength: 30)
            }
            Spacer()
        }
    }
}
