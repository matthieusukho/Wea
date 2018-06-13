//
//  ViewController.swift
//  WeatherApp
//
//  Created by Matthieu Sukho on 11/06/2018.
//  Copyright © 2018 Matthieu Sukho. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for city in CitiesData.list {
            let pin = MKPointAnnotation()
            pin.coordinate = city.coordinates
            pin.title = city.name
            mapView.addAnnotation(pin)
        }
        
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.coordinates = view.annotation?.coordinate
        detailViewController.name = view.annotation?.title!
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
   
    
}








