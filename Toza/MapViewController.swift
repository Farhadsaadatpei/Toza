//
//  MapViewViewController.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/3/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var googleMap: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //CLLocation
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        //Google Map
        googleMap.isMyLocationEnabled = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //Hide Status Bar
        setNeedsStatusBarAppearanceUpdate()
        
        // Dispose of any resources that can be recreated.
    }
    

    //Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

    //Dismiss Map View
    @IBAction func dismissMapView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
