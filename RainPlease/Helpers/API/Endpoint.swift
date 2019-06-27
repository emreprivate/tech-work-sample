//
//  Endpoint.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 22.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

struct Endpoint {
    private let path: String
    private let queryItems: [URLQueryItem]
}

extension Endpoint {
    
    enum ServiceType: String {
        case weather
        case forecast
        case dailyForecast = "forecast/daily"
    }
    
    static func serviceByCoordinates(service: ServiceType, lat: Double, lon: Double) -> Endpoint {
        return Endpoint(
            path: "/\(service.rawValue)",
            queryItems: [
                URLQueryItem(name: "lat", value: "\(lat.description)"),
                URLQueryItem(name: "lon", value: "\(lon.description)")
            ]
        )
    }
    
    static func serviceByCityName(service: ServiceType, name: String) -> Endpoint {
        return Endpoint(
            path: "/\(service.rawValue)",
            queryItems: [
                URLQueryItem(name: "q", value: "\(name)")
            ]
        )
    }
}

extension Endpoint {
    
    private var apiKey: String {
        return ProcessInfo.processInfo.environment["API_KEY"]!
    }
    
    private var commonQueryItems: [URLQueryItem] {
        return [URLQueryItem(name: "key", value: apiKey)]
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "worksample-api.herokuapp.com"
        components.path = "\(path)"
        components.queryItems = queryItems + commonQueryItems
        return components.url
    }
}
