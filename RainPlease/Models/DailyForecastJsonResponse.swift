//
//  DailyForecastJsonResponse.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

// MARK: - DailyForecast
struct DailyForecastJsonResponse: Codable {
    let city: City?
    let cod: String?
    let message: Double?
    let cnt: Int?
    let list: [DailyForecastSummary]?
}

// MARK: - List
struct DailyForecastSummary: Codable {
    let dt: Int?
    let temp: Temp?
    let pressure: Double?
    let humidity: Int?
    let weather: [WeatherElement]?
    let speed: Double?
    let deg, clouds: Int?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}
