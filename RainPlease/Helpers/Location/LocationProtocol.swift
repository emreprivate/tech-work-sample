//
//  LocationProtocol.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//
import Foundation

protocol LocationProtocol {
    
    // MARK: - Type Aliases
    typealias FetchLocationCompletion = (Location?, Error?) -> Void
    
    // MARK: - Methods
    func fetchLocation(completion: @escaping FetchLocationCompletion)
    
}


