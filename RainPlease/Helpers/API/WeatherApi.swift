//
//  WeatherApi.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

class WeatherApi {
    
    let networkManager: NetworkManager
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getWeatherByCoordinates(lat: Double, lon: Double, completionHandler:@escaping (WeatherJsonResponse?, Error?)->()) {
        let endpoint = Endpoint.serviceByCoordinates(service: .weather, lat: lat, lon: lon)
        self.networkManager.fetchObjects(endpoint: endpoint.url) { (response: WeatherJsonResponse?, error) in
            completionHandler(response, error)
        }
    }
    
    func getForecastByCoordinates(lat: Double, lon: Double, completionHandler:@escaping (ForecastJsonResponse?, Error?)->()) {
        let endpoint = Endpoint.serviceByCoordinates(service: .forecast, lat: lat, lon: lon)
        self.networkManager.fetchObjects(endpoint: endpoint.url) { (response: ForecastJsonResponse?, error) in
            completionHandler(response, error)
        }
    }
    
    func getDailyForecastByCoordinates(lat: Double, lon: Double, completionHandler:@escaping (DailyForecastJsonResponse?, Error?)->()) {
        let endpoint = Endpoint.serviceByCoordinates(service: .dailyForecast, lat: lat, lon: lon)
        self.networkManager.fetchObjects(endpoint: endpoint.url) { (response: DailyForecastJsonResponse?, error) in
            completionHandler(response, error)
        }
    }
}
