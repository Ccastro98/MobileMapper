//
//  ViewController.swift
//  MobileMapperLecture
//
//  Created by student3 on 3/20/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let herseyAnnotation = MKPointAnnotation()
    
    let address = "University of Illinois"
    let geocoder = CLGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let latitude: Double = 42.102332924
//        let longitude: Double = -87.955667844
//        let cordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let cordinateTwo = CLLocationCoordinate2D(latitude: 42.102332924, longitude: -87.955667844)
        herseyAnnotation.coordinate = cordinateTwo
        herseyAnnotation.title = "John Hersey High School"
        mapView.addAnnotation(herseyAnnotation)
        
       
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            for place in placemarks!
            {
                
                let annotation = MKPointAnnotation()
                
                annotation.coordinate = (place.location?.coordinate)!
                annotation.title = place.name
                self.mapView.addAnnotation(annotation)
                

            }
        }
        
       
    
    }
}

