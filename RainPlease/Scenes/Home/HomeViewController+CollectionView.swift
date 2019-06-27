//
//  HomeViewController+CollectionView.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 26.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.forecastObservable.value?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellName, for: indexPath) as? ForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = viewModel?.forecastObservable.value?.list?[indexPath.row]
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = df.date(from: item?.dtTxt ?? "")
        df.dateFormat = "HH:mm"
        cell.hourLabel.text = df.string(from: date ?? Date())
        cell.degreeLabel.text = String(format: "%0.f", item?.main?.temp ?? 0) + "°"
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width / 5
        return CGSize(width: width, height: collectionView.frame.height - 8)
    }
}
