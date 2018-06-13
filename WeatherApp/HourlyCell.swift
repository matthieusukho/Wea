//
//  HourlyCell.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 13/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import UIKit

class HourlyCell: UITableViewCell {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    func configure (hourly: (Int, String, String, Double)){
        print(hourly)
        temperature.text = "\(hourly.0)°C"
        icon.image = UIImage(named: "\(hourly.1)")
        time.text = "\(hourly.2)"
        humidity.text = "\(Int(hourly.3*100))%"

    }
}
