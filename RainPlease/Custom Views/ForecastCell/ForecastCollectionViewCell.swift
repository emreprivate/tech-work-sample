//
//  ForecastCollectionViewCell.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 25.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    func setup(viewModel: ForecastElement?) {
        if let viewModel = viewModel {
            hourLabel.text = viewModel.dt?.timeIntervalToHourString()
            degreeLabel.text = (viewModel.main?.temp?.stringValueWithoutDecimal ?? "") + "°"
            iconImageView.image = UIImage(named: (viewModel.weather?.first?.getWeatherImageName())!)
        }
    }
}
