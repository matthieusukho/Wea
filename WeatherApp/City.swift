//
//  City.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 11/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import Foundation
import SwiftyJSON
import MapKit

struct City {
    var name: String
    var coordinates: CLLocationCoordinate2D
    var forecast: Forecast?
    
    
    init(name: String, coordinates: CLLocationCoordinate2D) {
        self.name = name
        self.coordinates = coordinates
    }
    
    
}
