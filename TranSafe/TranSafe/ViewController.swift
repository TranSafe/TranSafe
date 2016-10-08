//
//  ViewController.swift
//  TranSafe
//
//  Created by Kevin Asistores on 10/8/16.
//  Copyright © 2016 Kevin Asistores. All rights reserved.
//

import UIKit
import DTMHeatmap
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    var heatmap: DTMHeatmap!
    
    var heatLocations: [NSArray]!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        locationManager = CLLocationManager()
        locationManager.delegate = self

        
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
        
        
    }
    
    func readData(array: [[Double]]){
        self.heatmap = DTMHeatmap()
        var dict = Dictionary<NSObject, AnyObject>();
        for entry in array{
            
            let coordinate = CLLocationCoordinate2D(latitude: entry[1], longitude: entry[0]);
            
            let mapPoint = MKMapPointForCoordinate(coordinate)
            
            let type = NSValue(MKCoordinate: coordinate).objCType // <- THIS IS IT
            
            let value = NSValue(bytes: unsafeAddressOf(mapPoint as! AnyObject), objCType: type);
            dict[value] = 1;
            
        }
        self.heatmap.setData(dict as [NSObject : AnyObject]);
        self.mapView.addOverlay(self.heatmap)
    }
    
    func mapView(mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return DTMHeatmapRenderer(overlay: overlay)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    func displayLocationInfo(placemark: CLPlacemark){
        self.locationManager.stopUpdatingLocation()
        print(placemark.locality)
        print(placemark.postalCode)
        print(placemark.administrativeArea)
        print(placemark.country)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error: " + error.localizedDescription)
        
    }
    
    func MKMapPointForCoordinate(coordinate: CLLocationCoordinate2D) -> MKMapPoint {
        
        return MKMapPointForCoordinate(coordinate);
        
    }


}

