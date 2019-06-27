//
//  WeatherJsonResponse.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

// MARK: - Weather
struct WeatherJsonResponse: Codable {
    let weather: [WeatherElement]?
    let base: String?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Double?
    let sys: Sys?
    let name: String?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Main
struct Main: Codable {
    let temp, pressure: Double?
    let humidity: Int?
    let tempMin, tempMax, seaLevel, grndLevel: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let message: Double?
    let country: String?
    let sunrise, sunset: Double?
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    func getWeatherImageName() -> String {
        
        var imageName = ""
        guard let id = id else { return "ClearSky" }
        if id >= 200 && id <= 232 {
            imageName = "Thunderstorm"
        } else if id >= 521 && id <= 531 {
            imageName = "ShowerRain"
        } else if id >= 500 && id <= 531 {
            imageName = "Rain"
        } else if id >= 600 && id <= 622 {
            imageName = "Snow"
        } else if id == 701 {
            imageName = "Mist"
        } else if id == 801 {
            imageName = "FewClouds"
        } else if id == 802 {
            imageName = "ScatteredClouds"
        } else if id == 803 {
            imageName = "BrokenClouds"
        } else {
            imageName = "ClearSky"
        }
        
        if icon?.last == "d" {
            return imageName + "Day"
        } else {
            return imageName + "Night"
        }
        
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed, deg: Double?
}
