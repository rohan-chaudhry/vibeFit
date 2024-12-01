//
//  WeatherService.swift
//  vibeFit
//
//  Created by Rohan Chaudhry on 12/1/24.
//  Purpose is to get iOS weather data, no external API calls needed --> hardcoding for now


// TODO: remove weather temp hardcode

import Foundation

class WeatherService {
    
    // Return mocked weather data (70°F, clear sky)
    func fetchWeather(completion: @escaping (Double, String) -> Void) {
        // Hardcoded temperature in Fahrenheit
        let temperatureFahrenheit = 70.0
        let weatherCondition = "Clear"
        
        // Return the hardcoded data
        completion(temperatureFahrenheit, weatherCondition)
    }
}
