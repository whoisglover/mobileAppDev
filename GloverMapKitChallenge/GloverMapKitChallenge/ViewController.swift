//
//  ViewController.swift
//  GloverMapKitChallenge
//
//  Created by Danny Glover on 11/4/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var latitude:CLLocationDegrees = 47.620586
    var longitude:CLLocationDegrees = -122.349298
    var latDelta:CLLocationDegrees = 0.01
    var lonDelta:CLLocationDegrees = 0.01
    
    
    @IBOutlet weak var mainPageMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta:lonDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mainPageMap.setRegion(region, animated:true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

