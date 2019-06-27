//
//  HomeViewController+TableView.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 26.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dailyForecastObservable.value?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellName, for: indexPath) as? DailyForecastTableViewCell else {
            return UITableViewCell()
        }
        let item = viewModel?.dailyForecastObservable.value?.list?[indexPath.row]
        
        let date = Date(timeIntervalSince1970: TimeInterval(exactly: item?.dt ?? 0)!)
        let df = DateFormatter()
        df.locale = Locale.init(identifier: "tr_TR")
        df.dateFormat = "EEEE"
        cell.dayLabel.text = df.string(from: date)
        cell.nightDegreeLabel.text = String(format: "%0.f", item?.temp?.night ?? 0) + "°"
        cell.dayDegreeLabel.text = String(format: "%0.f", item?.temp?.day ?? 0) + "°"
        return cell
    }
    
}
