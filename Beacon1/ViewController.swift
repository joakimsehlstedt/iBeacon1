//
//  ViewController.swift
//  Beacon1
//
//  Created by Sehlstedt on 19/03/2015.
//  Copyright (c) 2015 Kings Hill Productions. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D"), identifier: "Estimote B9407F30")
    @IBOutlet weak var mainLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        var myBeacon = CLBeacon()
        
        if beacons.count > 0 {
            myBeacon = beacons[0] as CLBeacon
        }
        
        var beaconProximity = myBeacon.proximity as CLProximity
        var message:String
        switch beaconProximity {
            case CLProximity.Unknown:
                message = "Unknown"
                break;
            case CLProximity.Immediate:
                message = "Immediate"
                break;
            case CLProximity.Near:
                message = "Near"
                break;
            case CLProximity.Far:
                message = "Far"
                break;
        }
        println(message)
        mainLabel.text = message
    }
}

