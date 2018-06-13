//
//  Infos1Cell.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 13/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import UIKit

class Infos1Cell: UITableViewCell {

    @IBOutlet weak var titleHumidity: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var WindSpeed: UILabel!
    @IBOutlet weak var titleWind: UILabel!
    
    func configure(withForecast forecast: Forecast) {
    titleHumidity.text = "Humidity"
    humidity.text = "\(forecast.humidity*100)%"
    titleWind.text = "Wind Speed"
    WindSpeed.text = "\(forecast.windSpeed)km/h"
    }
}
