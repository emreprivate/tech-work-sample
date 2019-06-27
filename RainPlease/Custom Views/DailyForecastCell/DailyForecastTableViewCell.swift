//
//  DailyForecastTableViewCell.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 25.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nightDegreeLabel: UILabel!
    @IBOutlet weak var dayDegreeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    func setup(viewModel: DailyForecastSummary?) {
        if let viewModel = viewModel {
            dayLabel.text = viewModel.dt?.timeIntervalToDayString()
            nightDegreeLabel.text = (viewModel.temp?.night?.stringValueWithoutDecimal ?? "") + "°"
            dayDegreeLabel.text = (viewModel.temp?.day?.stringValueWithoutDecimal ?? "") + "°"
            iconImageView.image = UIImage(named: (viewModel.weather?.first?.getWeatherImageName())!)
        }
    }
}
