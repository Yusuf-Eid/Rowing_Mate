//
//  Speedometer.swift
//  Rowing Mate
//
//  Created by Yusuf Soliman on 7/3/17.
//  Copyright © 2017 GradProj. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Speedometer: UIViewController,  CLLocationManagerDelegate {
    //@IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    //var startDate: Date!
    var traveledDistance: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.distanceFilter = 10
            //mapView.showsUserLocation = true
            //mapView.userTrackingMode = .follow
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last ?? "none")
        //if startDate == nil {
        //    startDate = Date()
        //} else {
        //    print("elapsedTime:", String(format: "%.0fs", Date().timeIntervalSince(startDate)))
        //}
        if startLocation == nil {
            startLocation = locations.first
        } else if let location = locations.last {
            traveledDistance += lastLocation.distance(from: location)
            print("Traveled Distance:",  traveledDistance)
            //print("Straight Distance:", startLocation.distance(from: locations.last!))
        }
        lastLocation = locations.last
    }
}
