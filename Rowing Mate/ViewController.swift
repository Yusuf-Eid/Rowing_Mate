//
//  ViewController.swift
//  Rowing expert
//
//  Created by Yusuf Soliman on 4/27/17.
//  Copyright © 2017 GradProj. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate {
    
//    //@IBOutlet weak var mapView: MKMapView!
//    let locationManager = CLLocationManager()
//    var startLocation: CLLocation!
//    var lastLocation: CLLocation!
//    //var startDate: Date!
//    var traveledDistance: Double = 0
    
    //MARK: Properties

//    @IBOutlet weak var Distance: UILabel!
//    @IBOutlet weak var Speed: UILabel!

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.requestWhenInUseAuthorization()
//            locationManager.startUpdatingLocation()
//            locationManager.startMonitoringSignificantLocationChanges()
//            locationManager.distanceFilter = 2
//            //mapView.showsUserLocation = true
//            //mapView.userTrackingMode = .follow
//        }
        
        print("Hello world")
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations.last ?? "none")
//        //if startDate == nil {
//        //    startDate = Date()
//        //} else {
//        //    print("elapsedTime:", String(format: "%.0fs", Date().timeIntervalSince(startDate)))
//        //}
//        if startLocation == nil {
//            startLocation = locations.first
//        } else if let location = locations.last {
//            traveledDistance += lastLocation.distance(from: location)
//            //print("Traveled Distance:",  traveledDistance)
//            Distance.text = "\(traveledDistance)"
//            Speed.text = "\(location.speed)"
//            //print("Straight Distance:", startLocation.distance(from: locations.last!))
//        }
//        lastLocation = locations.last
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    @IBAction func startNewSession(_ sender: Any) {
        performSegue(withIdentifier: "Segue", sender: self)
    }


}

