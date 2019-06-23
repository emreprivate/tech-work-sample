//
//  HomeViewModel.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

class HomeViewModel: NSObject {
    
    // MARK: - Properties
    private var weatherApi: WeatherApi!
    private let locationService: LocationProtocol
    
    // MARK: - Observables
    let isLoadingObservable = Observable<Bool>(value: false)
    let weatherObservable = Observable<WeatherJsonResponse?>(value: nil)
    let forecastObservable = Observable<ForecastJsonResponse?>(value: nil)
    let dailyForecastObservable = Observable<DailyForecastJsonResponse?>(value: nil)
    let errorObservable = Observable<Error?>(value: nil)
    
    // MARK: - Initialization
    init(weatherApi: WeatherApi, locationService: LocationProtocol) {
        // Inject the dependency
        self.weatherApi = weatherApi
        self.locationService = locationService
        super.init()
        fetchLocation()
    }
    
    //MARK: - Private Methods
    private func fetchLocation() {
        locationService.fetchLocation { [weak self] (location, error) in
            if let error = error {
                self?.errorObservable.value = error
            } else if let location = location {
                self?.makeRequestWithCoordinates(lat: location.lat, lon: location.lon)
            } else {
                self?.errorObservable.value = NSError(domain: "Unknown error", code: 400, userInfo: nil)
            }
        }
    }
    
    private func makeRequestWithCoordinates(lat: Double, lon: Double) {
        self.weatherApi.getWeatherByCoordinates(lat: lat, lon: lon) { [weak self] (weatherResponse, error) in
            self?.errorObservable.value = error
            self?.weatherObservable.value = weatherResponse
        }
        
        self.weatherApi.getForecastByCoordinates(lat: lat, lon: lon) { [weak self] (forecastResponse, error) in
            self?.errorObservable.value = error
            self?.forecastObservable.value = forecastResponse
        }
        
        self.weatherApi.getDailyForecastByCoordinates(lat: lat, lon: lon) { [weak self] (dailyForecastResponse, error) in
            self?.errorObservable.value = error
            self?.dailyForecastObservable.value = dailyForecastResponse
        }
    }
}
