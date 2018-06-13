//
//  HeaderTableViewCell.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 12/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func configure(withForecast forecast: Forecast) {
        temperature.text = "\(forecast.temperature)°C"
        icon.image = UIImage(named: "\(forecast.icon)") 
        summary.text = forecast.dailySummary
        
    }
    

}
