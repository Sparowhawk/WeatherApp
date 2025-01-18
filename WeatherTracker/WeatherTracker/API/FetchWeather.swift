//
//  FetchWeather.swift
//  WeatherTracker
//
//  Created by Dylan Nienberg on 1/18/25.
//

import SwiftUI

class FetchWeather {
    let apiKey = "1e4823c0bea741ee81d201802251801"
    let baseURL = "https://api.weatherapi.com/v1"
    
    func getCurrentWeather(city: String, completion: @escaping (Weather?) -> Void) {
        guard let url = URL(string: "\(baseURL)/current.json?key=\(apiKey)&q=\(city)") else {
            completion(nil)
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(weather)
            } catch {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

struct Weather: Codable {
    let location: Location
    let current: Current
    
    struct Location: Codable {
        let name: String
    }
    
    struct Current: Codable {
        let temp_f: Double
        let condition: Condition
        let humidity: Int
        let feelslike_f: Double
        let uv: Double
        
        struct Condition: Codable {
            let text: String
            let icon: String
        }
    }
}
