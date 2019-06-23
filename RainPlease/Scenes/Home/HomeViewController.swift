//
//  ViewController.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 22.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,ViewModelBindable {
    
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
        
    }
    
    func setupViewModel(with viewModel: HomeViewModel) {
        
    }


}

