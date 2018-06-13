//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 11/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController, MKMapViewDelegate, UITableViewDataSource {
    
    var coordinates: CLLocationCoordinate2D?
    var name: String?
    var city: City?
    var forecast: Forecast?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        requestCities()
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return forecast?.hourly.count ?? 0
        case 2:
            return forecast?.daily.count ?? 0
        default:
            return 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderTableViewCell
            if let forecast = forecast {
                cell.configure(withForecast: forecast)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "hourCell", for: indexPath) as! HourlyCell
            if let forecast = forecast {
                cell.configure(hourly: forecast.hourly[indexPath.row])
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as! DayCell
            if let forecast = forecast {
                cell.configure(daily: forecast.daily[indexPath.row])
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }

    
    func requestCities() {
        
        if let latitude = coordinates?.latitude, let longitude = coordinates?.longitude {
            print(latitude)
        let url = "https://api.darksky.net/forecast/9c68b3c6b06f025b99e821df42d434f1/\(latitude),\(longitude)?units=si"
        Alamofire.request(url).responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value)
                print(json)
                self.forecast = Forecast(json: json)
                self.tableView.reloadData()
            }
            
        }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Aujourd'hui"
        case 2:
            return "Semaine"
        default:
            return nil
        }
    }
   
}
