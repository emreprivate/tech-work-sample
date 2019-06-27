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
        cell.setup(viewModel: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
