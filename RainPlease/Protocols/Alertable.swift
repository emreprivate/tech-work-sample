//
//  Alertable.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

protocol Alertable {
    func showAlertWith(message messageString: String, title: String)
}
extension Alertable where Self: UIViewController {
    func showAlertWith(message messageString: String, title: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: messageString, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
