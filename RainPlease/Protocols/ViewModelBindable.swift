//
//  ViewModelBindable.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

protocol ViewModelBindable {
    associatedtype ViewModel
    
    var viewModel: ViewModel? { get set }
    func setupViewModel(with viewModel: ViewModel)
}
