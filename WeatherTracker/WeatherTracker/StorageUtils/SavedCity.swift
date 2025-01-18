//
//  SavedCity.swift
//  WeatherTracker
//
//  Created by Dylan Nienberg on 1/18/25.
//

import SwiftUI

func saveCityName(cityName:String) {
    UserDefaults().set(cityName, forKey: "SavedCity")
}

func retrieveSavedCity() -> String {
    return UserDefaults().string(forKey: "SavedCity") ?? ""
}
