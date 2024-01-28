//
//  ViewController.swift
//  Core Location Framework
//
//  Created by Ercan Kabali on 28.01.2024.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
 
    var locationManager:CLLocationManager = CLLocationManager()
    @IBOutlet weak var enlemLabel: UILabel!
    @IBOutlet weak var boylamLabel: UILabel!
    @IBOutlet weak var hizLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    
    }
    
}


extension ViewController:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum:CLLocation =  locations[locations.count - 1]
        
        enlemLabel.text = "Enlem : \(sonKonum.coordinate.latitude)"
        boylamLabel.text = "Boylam : \(sonKonum.coordinate.longitude)"
        hizLabel.text = "Hiz :\(sonKonum.speed)"
        
        let konum  = CLLocationCoordinate2D(latitude: sonKonum.coordinate.latitude, longitude: sonKonum.coordinate.longitude)
        let span  = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        
        mapView.setRegion(bolge, animated: true)
        mapView.showsUserLocation = true
        
    }
}
