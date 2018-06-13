//
//  Forecast.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 12/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Forecast {
    var icon, summary, hourlySummary, dailySummary : String
    var temperature, windSpeed, pressure, humidity, uvIndex: Int
    var hourly: [(Int,String, String, Double)]
    var daily : [(String, String, Int, Int)]
    
    
    init(json: JSON) {
        self.icon = json["currently"]["icon"].stringValue
        self.summary = json["currently"]["summary"].stringValue
        self.hourlySummary = json["hourly"]["summary"].stringValue
        self.dailySummary = json["daily"]["summary"].stringValue
        self.temperature = json["currently"]["temperature"].intValue
        self.windSpeed = json["currently"]["windSpeed"].intValue
        self.pressure = json["currently"]["pressure"].intValue
        self.humidity = json["currently"]["humidity"].intValue
        self.uvIndex = json["currently"]["uvIndex"].intValue
        self.hourly = []
        self.daily = []
        
        
        for i in 1...10 {
            let temperature = json["hourly"]["data"][i]["temperature"].intValue
            let icon = json["hourly"]["data"][i]["icon"].stringValue
            let time = Date(timeIntervalSince1970: TimeInterval(json["hourly"]["data"][i]["time"].intValue))
            let humidity = json["hourly"]["data"][i]["humidity"].doubleValue
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH" //Specify your format that you want
            let hour = dateFormatter.string(from: time)
                let data = (temperature, icon, hour, humidity)
                self.hourly.append(data)
        }
        
        for i in 1...7 {
            let icon = json["daily"]["data"][i]["icon"].stringValue
            let time = Date(timeIntervalSince1970: TimeInterval(json["daily"]["data"][i]["time"].intValue))
            let tempMax = json["daily"]["data"][i]["temperatureHigh"].intValue
            let tempMin = json["daily"]["data"][i]["temperatureLow"].intValue
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.locale = Locale(identifier: "fr_FR")
            let day = dateFormatter.string(from: time)
            let data = (day, icon, tempMax, tempMin)
            self.daily.append(data)
        }
        
    }
    
   
    
    
}
