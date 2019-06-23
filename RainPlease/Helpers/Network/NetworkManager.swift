//
//  NetworkManager.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 22.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

public class NetworkManager {
    
    private let session = URLSession(configuration: .default)
    
    private func getData(endpoint : URL, completionHandler:@escaping(Data)->(),errorHandler:@escaping(Error)->()) {
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let data = data {
                completionHandler(data)
            } else if let error = error {
                errorHandler(error)
            }
        }
        task.resume()
    }
    
    func fetchObjects<T : Codable>(endpoint : URL?, completionHandler:@escaping (T?,Error?)->()) {
        guard let url = endpoint else {
            return
        }
        getData(endpoint: url, completionHandler: { (data) in
            do {
                let element = try JSONDecoder().decode(T.self, from: data)
                completionHandler(element, nil)
            } catch let error {
                completionHandler(nil, error)
            }
        }) { (error) in
            completionHandler(nil, error)
        }
        
    }
    
}
