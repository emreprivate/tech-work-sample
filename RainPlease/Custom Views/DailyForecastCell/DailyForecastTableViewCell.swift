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

    }

}
