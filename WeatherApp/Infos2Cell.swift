//
//  Infos2Cell.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 13/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import UIKit

class Infos2Cell: UITableViewCell {

    @IBOutlet weak var titlePressure: UILabel!
    @IBOutlet weak var uvIndex: UILabel!
    @IBOutlet weak var titleUVindex: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    func configure(withForecast forecast: Forecast) {
        titlePressure.text = "Pressure"
        pressure.text = "\(forecast.pressure)hPa"
        titleUVindex.text = "UV Index"
        uvIndex.text = "\(forecast.uvIndex)"
    }
}
