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
    
}

extension Endpoint {
    private var commonQueryItems: [URLQueryItem] {
        return []
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ""
        components.path = "\(path)"
        components.queryItems = queryItems + commonQueryItems
        return components.url
    }
}
