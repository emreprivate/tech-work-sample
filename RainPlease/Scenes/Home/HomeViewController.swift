//
//  ViewController.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 22.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ViewModelBindable, Alertable {
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    @IBOutlet weak var dailyForecastTableView: UITableView!
    var indicatorView: IndicatorView?
    
    // MARK: - Properties
    var viewModel: HomeViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
        }
    }
    let tableViewCellName = "DailyForecastTableViewCell"
    let collectionViewCellName = "ForecastCollectionViewCell"
    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(weatherApi: WeatherApi(networkManager: NetworkManager()), locationService: LocationManager())
        arrangeComponents()
    }
    
    private func arrangeComponents() {
        indicatorView = IndicatorView(view: self.view)
        setupTableView()
        setupCollectionView()
    }
    
    private func setupTableView() {
        let tableViewCell = UINib(nibName: tableViewCellName, bundle: nil)
        dailyForecastTableView.register(tableViewCell, forCellReuseIdentifier: tableViewCellName)
        dailyForecastTableView.delegate = self
        dailyForecastTableView.dataSource = self
    }
    
    private func setupCollectionView() {
        let collectionViewCell = UINib(nibName: collectionViewCellName, bundle: nil)
        forecastCollectionView.register(collectionViewCell, forCellWithReuseIdentifier: collectionViewCellName)
        forecastCollectionView.delegate = self
        forecastCollectionView.dataSource = self
    }
    
    func setupViewModel(with viewModel: HomeViewModel) {
        viewModel.isLoadingObservable.addObserver { [weak self] (isLoading) in
            if isLoading {
                self?.indicatorView?.show()
            } else {
                self?.indicatorView?.hide()
                self?.dailyForecastTableView.reloadData()
                self?.forecastCollectionView.reloadData()
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
