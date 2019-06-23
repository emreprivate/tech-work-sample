//
//  ForecastJsonResponse.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

// MARK: - Forecast
struct ForecastJsonResponse: Codable {
    let cod: String?
    let message: Double?
    let cnt: Int?
    let list: [ForecastElement]?
    let city: City?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let country: String?
    let population, timezone: Int?
}

// MARK: - List
struct ForecastElement: Codable {
    let dt: Int?
    let main: Main?
    let weather: [WeatherElement]?
    let clouds: Clouds?
    let wind: Wind?
    let dtTxt: String?
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind
        case dtTxt = "dt_txt"
    }
}
