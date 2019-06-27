//
//  LocationManager.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//
import Foundation
import CoreLocation

class LocationManager: NSObject, LocationProtocol {
    
    // MARK: - Properties
    private var didFetchLocation: FetchLocationCompletion?
    
    // MARK: -
    
    private lazy var locationManager: CLLocationManager = {
        // Initialize Location Manager
        let locationManager = CLLocationManager()
        
        // Configure Location Manager
        locationManager.delegate = self
        
        
        return locationManager
    }()
    
    // MARK: - Location Service
    
    func fetchLocation(completion: @escaping LocationProtocol.FetchLocationCompletion) {
        // Store Reference to Completion
        self.didFetchLocation = completion
        
        // Fetch Location
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            // Request Authorization
            locationManager.requestWhenInUseAuthorization()
            
        } else if status == .authorizedWhenInUse {
            // Fetch Location
            locationManager.startUpdatingLocation()
            
        } else {
            // Invoke Completion Handler
            let error = NSError(domain: "Not authorized for location service.", code: -1, userInfo: nil)
            didFetchLocation?(nil, error)
            
            // Reset Completion Handler
            didFetchLocation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        // Invoke Completion Handler
        didFetchLocation?(Location(location: location), nil)
        
        // Reset Completion Handler
        didFetchLocation = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //fail error may not be understandable sometimes so I created custom error.
        let error = NSError(domain: "Unknown error while getting location.", code: -1, userInfo: nil)
        didFetchLocation?(nil, error)
    }
    
}

fileprivate extension Location {
    
    // MARK: - Initialization
    init(location: CLLocation) {
        lat = location.coordinate.latitude
        lon = location.coordinate.longitude
    }
    
}

