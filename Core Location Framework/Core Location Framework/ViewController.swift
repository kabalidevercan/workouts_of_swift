//
//  ViewController.swift
//  Core Location Framework
//
//  Created by Ercan Kabali on 28.01.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {
 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    let istek = MKLocalSearch.Request()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        mapView.delegate = self
        
        let konum = CLLocationCoordinate2D(latitude: 41.0370014, longitude: 28.9763369)
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        istek.region = mapView.region
    }
    
}

extension ViewController:UISearchBarDelegate,MKMapViewDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        istek.naturalLanguageQuery = searchBar.text!
        
        
        if mapView.annotations.count > 0 {
            mapView.removeAnnotations(mapView.annotations)
            
        }
        
        let arama = MKLocalSearch(request: istek)
        
        arama.start(completionHandler: {(response,err) in
            if err != nil {
                print("Hata")
            }else if response!.mapItems.count == 0 {
            print("mekan yok")
            }else {
                for mekan in response!.mapItems {
                    
                    if let mekanismi = mekan.name,let mekantel = mekan.phoneNumber {
                        print("Ad \(mekanismi)")
                        print("Tel\(mekantel)")
                        print("Enlem: \(mekan.placemark.coordinate.latitude)")
                        print("Boylam: \(mekan.placemark.coordinate.longitude)")
                        
                        let pin = MKPointAnnotation()
                        pin.coordinate = mekan.placemark.coordinate
                        pin.title = mekanismi
                        pin.subtitle = mekantel
                        
                        self.mapView.addAnnotation(pin)
                        
                    }
                    
                }
                
            }
        })
        
    }
    
    
}

