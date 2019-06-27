//
//  Double+Extension.swift
//  RainPlease
//
//  Created by Emre Çelikörs on 27.06.2019.
//  Copyright © 2019 Emre Çelikörs. All rights reserved.
//

import Foundation

extension Double {
    var stringValueWithoutDecimal: String {
        return String(format: "%0.f", self)
    }
    
    func timeIntervalToDayString()-> String {
        let date = Date(timeIntervalSince1970: TimeInterval(exactly: self) ?? TimeInterval.init())
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        return df.string(from: date)
    }
    
    func timeIntervalToHourString()-> String {
        let date = Date(timeIntervalSince1970: TimeInterval(exactly: self) ?? TimeInterval.init())
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        return df.string(from: date)
    }
}
