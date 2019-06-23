//
//  IndicatorView.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 23.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import UIKit

class IndicatorView  {
    
    private var indicatorView = UIView(frame: CGRect.zero)
    
    init(view: UIView) {
        
        view.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        indicatorView.layer.cornerRadius = 5.0
        indicatorView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        indicatorView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        indicatorView.addSubview(indicator)
        indicator.heightAnchor.constraint(equalToConstant: 40).isActive = true
        indicator.widthAnchor.constraint(equalToConstant: 40).isActive = true
        indicator.centerXAnchor.constraint(equalTo: indicatorView.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: indicatorView.centerYAnchor).isActive = true
        
        self.hide()
    }
    
    func show() {
        DispatchQueue.main.async {
            self.indicatorView.isHidden = false
            self.indicatorView.alpha = 1
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            DispatchQueue.main.async {
                self.indicatorView.alpha = 0
            }
        }) { (finished) in
            DispatchQueue.main.async {
                self.indicatorView.isHidden = true
                self.indicatorView.alpha = 1
            }
        }
        
    }
    
}

