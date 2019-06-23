//
//  ViewController.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 22.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ViewModelBindable, Alertable {
    
    var indicatorView: IndicatorView?
    
    typealias ViewModel = HomeViewModel
    var viewModel: HomeViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            // Setup View Model
            setupViewModel(with: viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(weatherApi: WeatherApi(networkManager: NetworkManager()), locationService: LocationManager())
        indicatorView = IndicatorView(view: self.view)
    }
    
    func setupViewModel(with viewModel: HomeViewModel) {
        viewModel.isLoadingObservable.addObserver { [weak self] (isLoading) in
            if isLoading {
                self?.indicatorView?.show()
            } else {
                self?.indicatorView?.hide()
            }
        }
        
        viewModel.errorObservable.addObserver { [weak self] (error) in
            if let error = error {
                self?.showAlertWith(message: error.localizedDescription, title: "Error")
            }
        }
    }

    deinit {
        viewModel?.isLoadingObservable.removeObserver()
        viewModel?.errorObservable.removeObserver()
    }

}

