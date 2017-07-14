	//
//  Training sessionViewController.swift
//  Rowing Mate
//
//  Created by Yusuf Soliman on 7/5/17.
//  Copyright © 2017 GradProj. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class Training_sessionViewController: UIViewController , CLLocationManagerDelegate {
    
    //MARK: Properties
    
    
    @IBOutlet weak var Dist: UILabel!
    @IBOutlet weak var Spd: UILabel!
    @IBOutlet weak var strCnt: UILabel!
    @IBOutlet weak var Tmr: UILabel!
    
    
    
    
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var traveledDistance: Double = 0
    var startLoc: Bool = false
    var startAcc: Bool = false
    var stopAcc: Bool = false
    
    var motionManager = CMMotionManager()
    
    var time = 0
    var seconds = 00
    var minutes = 00
    var hours = 00
    
    var timer = Timer()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        
        var flag, flag2  :Bool ; flag=false;  flag2=true;
        var avg_acc, pthreshold, nthreshold, ymax, ymin :Double ; avg_acc=0 ; pthreshold=0.25 ; nthreshold = -0.25; ymax=0; ymin=0;
        var strokeCount :Int ;
        strokeCount = 0;
        
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.distanceFilter = 2
            
        }
        
        
        motionManager.accelerometerUpdateInterval = 0.01
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
           
            if self.startAcc{
            
                if let myData = data
                {
                    avg_acc = myData.acceleration.z
                    
                    //self.zacc.text = String(avg_acc)
                    print(avg_acc)
                
                    if avg_acc>pthreshold && flag==false{
                        flag2=true
                        if avg_acc>ymax{
                            ymax=avg_acc
                        }
                        
                    }
                    if avg_acc<=nthreshold && flag==false && flag2==true{
                        flag=true
                        flag2=false
                        pthreshold=0.6*ymax
                        if pthreshold<0.1{
                            pthreshold=0.1
                        }
                        ymax=0
                    }
                    if avg_acc < nthreshold && flag == true{
                        flag2=true
                        if avg_acc<ymin{
                            ymin=avg_acc
                        }
                        
                    }
                    if avg_acc>=pthreshold && flag==true && flag2==true{
                        strokeCount = strokeCount+1
                        flag=false
                        flag2=false
                        nthreshold=0.6*ymin
                        if (nthreshold > -0.1){
                            nthreshold = -0.1
                        }
                        ymin=0
                    }
                    
                    
                    
                }
            }
            else if self.stopAcc{
                strokeCount = 0
                pthreshold=0.25 ; nthreshold = -0.25; ymax=0; ymin=0;
            }
            
            self.strCnt.text = "\(strokeCount)"
            print(strokeCount)
            print(pthreshold)
            print(nthreshold)
        }

        
    }
    
    
    
    @IBAction func start(_ sender: Any)
    {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Training_sessionViewController.action), userInfo: nil, repeats: true)
        startLoc = true
        startAcc = true
        
    }
    
    @IBAction func pause(_ sender: Any)
    {
        timer.invalidate()
        startLoc = false
        startAcc = false
        stopAcc = false
    }
    
    @IBAction func stop(_ sender: Any)
    {
        timer.invalidate()
        time = 0
        seconds = 00
        minutes = 00
        hours = 00
        Tmr.text = String(format: "%02d",hours) + ":" + String(format: "%02d",minutes) + ":" + String(format: "%02d",seconds)
        startLoc = false
        startAcc = false
        stopAcc = true
        traveledDistance = 0
        Dist.text = "\(traveledDistance)"
        Spd.text = "0.0"
        
        
    }
    
    func action()
    {
        time += 1
        minutes = (time % 3600) / 60
        hours = time / 3600
        seconds = time % 60
        Tmr.text = String(format: "%02d",hours) + ":" + String(format: "%02d",minutes) + ":" + String(format: "%02d",seconds)
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations.last ?? "none")
        
       if startLoc{
          
            //print("entered")
            if startLocation == nil {
                startLocation = locations.first
            } else if let location = locations.last {
                traveledDistance += lastLocation.distance(from: location)
                
                traveledDistance = round(100*traveledDistance)/100
                Dist.text = "\(traveledDistance)"
                //Spd.text = "\(location.speed)"
                Spd.text = "\(round(100*location.speed)/100)"
                
            }
            lastLocation = locations.last
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
