//
//  DayCell.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 13/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var tempMorning: UILabel!
    @IBOutlet weak var tempNoon: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func configure (daily: (String, String, Int, Int)){
        day.text = "\(daily.0)"
        icon.image = UIImage(named: "\(daily.1)")
        tempNoon.text = "\(daily.2)°C"
        tempMorning.text = "\(daily.3)°C"
    }
    
    
}
